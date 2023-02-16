 # LEVEL3 클론코딩 - 날씨앱

 ## 화면 그리기, 불투명한 화면, 블러스택뷰

- 블러스택뷰
 ```swift
VStack(spacing: 0) {
                    Text("Cloudy conditions will continue for the rest of the day. Wind gust are up to 5 m/s")
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .zIndex(1)
                    Divider()
                    HStack { ... }
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .offset(y: topOffset >= 200 ? 0 : topOffset - 200)
                        .zIndex(0)
                        .clipped()
                }
                .offset(y: topOffset >= 200 ? 0 : -(topOffset - 200))
                .background(
                GeometryReader(content: { geometry ->
                    Color in
                    
                    let minY = geometry.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        topOffset = minY
                    }
                    
                    return Color.red
                })
                )
                .padding()
                .cornerRadius(13)
}
```
- y 값이 200 보다 작으면 음수가 되어 위로 올라간다.
    >```swift
    >.offset(y: topOffset >= 200 ? 0 : topOffset - 200)
    >```

<br>

- VStack 밖에 적용해준 효과
- 제자리에 걸려있는 것 처럼 보인다.
    >```swift
    >.offset(y: topOffset >= 200 ? 0 : -(topOffset - 200))
    >```

<br>

- zIndex 값을 Text에 1, HStack에 0을 주어 Text가 위로 오게 하고
- .clipped로 올라가면서 초과되는 부분을 잘라내준다.

<br>

## 뷰 분리하기
```swift
// BlurStackView

struct BlurStackView<Header: View, Content: View>: View {
    
    var headerView: Header
    var contentView: Content
    
    @State var topOffset: CGFloat = 0
    
    init(@ViewBuilder headerView: @escaping () -> Header,
         @ViewBuilder contentView: @escaping () -> Content  ) {
        self.headerView = headerView()
        self.contentView = contentView()
    }

    var body: some View {
        VStack(spacing: 0) {
            headerView
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .zIndex(1)
            Divider()
            contentView
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .offset(y: topOffset >= 200 ? 0 : topOffset - 200)
                .zIndex(0)
                .clipped()         
        }

    // 생략

}
```
- init
- View를 2개 입력 받아서
- 각각의 옵션값들을 준다. (속성 )

<br>

### ContentView의 BlurStackView{} 부분
```swift
// ContentView
BlurStackView {
    Text("Cloudy conditions will continue for the rest of the day. Wind gust are up to 5 m/s")
} contentView: {
    HStack {
        VStack {
            Text("Now")
            Image(systemName: "cloud.fill")
            Text("6°")
        }
        VStack {
            Text("20")
            Image(systemName: "cloud.fill")
            Text("6°")
        }
        VStack {
            Text("21")
            Image(systemName: "cloud.fill")
            Text("6°")
        }
        VStack {
            Text("22")
            Image(systemName: "cloud.fill")
            Text("6°")
        }
        VStack {
            Text("23")
            Image(systemName: "cloud.fill")
            Text("6°")
        }
        VStack {
            Text("0")
            Image(systemName: "cloud.fill")
            Text("6°")
        }
    }
}

```
- 사용하고 싶은 곳애서   
- BlurStackView(headerView: () -> View, contentView: () -> View)
- 를 사용하여 원하는 View들만 넣어서 사용할 수 있다.

<br>

## 날씨정보뷰
```swift
// ForecastView
struct ForecastView: View {
    
    var time: String
    var celsius: CGFloat
    var imageName: String
    
    var body: some View {
        VStack {
            Text(time)
                .bold()
            
            Image(systemName: imageName)
                .font(.title3)
                .symbolVariant(.fill)
                .symbolRenderingMode(.multicolor )
                .frame(height: 30)
            
            Text("\(Int(celsius))°")
                .bold()
        }
    }
}
```
- 각각 시간, 섭씨, 날씨모양 그림을 받아와서 그려주는 View

<br>

```swift
// ContentView 중 날씨정보뷰 부분
BlurStackView {
    Text("Cloudy conditions will continue for the rest of the day. Wind gust are up to 5 m/s")
} contentView: {
    HStack {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 36){
                ForecastView(time: "Now", celsius: 6, imageName: "cloud.fill")
                ForecastView(time: "19", celsius: 6, imageName: "cloud.fill")
                ForecastView(time: "20", celsius: 5, imageName: "cloud.fill")
                ForecastView(time: "21", celsius: 4, imageName: "cloud.fill")
                ForecastView(time: "22", celsius: 4, imageName: "cloud.fill")
                ForecastView(time: "23 ", celsius: 5, imageName: "cloud.fill")
            }
            
        }
    }
}
```

<br>

## 코너뷰
```swift
// BlurStackView

VStack(spacing: 0) {
            headerView
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(.white)
                .background(.ultraThinMaterial, in: IndividualCorner(corners: bottomOffset < 35 ? .allCorners : [.topLeft, .topRight], radius: 16))
                .zIndex(1)
            Divider()
            contentView
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(.ultraThinMaterial, in: IndividualCorner(corners: [.bottomLeft, .bottomRight], radius: 16))
                .offset(y: topOffset >= 200 ? 0 : topOffset - 200)
                .zIndex(0)
                .clipped() 
        }
        .offset(y: topOffset >= 200 ? 0 : -(topOffset - 200))
        .background(
            GeometryReader(content: { geometry ->
                Color in
                
                let minY = geometry.frame(in: .global).minY
                let maxY = geometry.frame(in: .global).maxY
                
                DispatchQueue.main.async {
                    topOffset  = minY
                    bottomOffset = maxY - 240
                }
                
                return Color.clear
            })
        )
```

```swift
// IndividualCorner

struct IndividualCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius) )
        
        return Path(path.cgPath)
    }
}

```

- 아직 headerView와 contentView가 겹쳤을 때 아랫부분 코너들의 cornerRadius 디테일 수정이 필요하다.

<br>

## 코너뷰

```swift
BlurStackView {
    HStack {
        Image(systemName: "calendar")
        Text("10-DAY FORECAST")
    }
} contentView: {
    ForEach(forecast) { dayForecast in
        VStack {
            HStack {
                Text(dayForecast.day)
                
                Image(systemName: dayForecast.imageName)
                    .symbolRenderingMode(.multicolor)
                
                Text("\(dayForecast.lowTemperture.description)°") // 숫자 이므로 .description
                
                ZStack {
                    Capsule()
                        .foregroundColor(.white)
                    
                    GeometryReader { proxy in
                        Capsule()
                            .fill(.linearGradient(Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: dayForecast.arrange)
                    }
                }
                
                Text("\(dayForecast.highTemperture.description)°")
            }
        }
    }
}

```
- "10-DAY FORECAST" View를 Model을 이용하여 반복문으로 간소화 해주었다.

<br>
- Forecast

```swift
import Foundation

struct Forecast: Identifiable {
    var id = UUID()
    let day: String
    let lowTemperture: Int
    let highTemperture: Int
    let imageName: String
    let arrange: CGFloat
}

var forecast = [

    Forecast(day: "Today",
             lowTemperture: -2,
             highTemperture: 7,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Thu",
             lowTemperture: -1,
             highTemperture: 6,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Fri",
             lowTemperture: -3,
             highTemperture: 11,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Sat",
             lowTemperture: 3,
             highTemperture: 11,
             imageName: "cloud.rain.fill",
             arrange: 100),
    Forecast(day: "Sun",
             lowTemperture: -1,
             highTemperture: 7,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Mon",
             lowTemperture: -4,
             highTemperture: 6,
             imageName: "sun.max.fill",
             arrange: 100),
    Forecast(day: "Tue",
             lowTemperture: -5,
             highTemperture: 3,
             imageName: "sun.max.fill",
             arrange: 100),
    Forecast(day: "Wed",
             lowTemperture: -5,
             highTemperture: 6,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Thu",
             lowTemperture: -1,
             highTemperture: 10,
             imageName: "cloud.sun.fill",
             arrange: 100),
    Forecast(day: "Fri",
             lowTemperture: -2,
             highTemperture: 11,
             imageName: "sun.max.fill",
             arrange: 100),
]
```
- 각 날짜를 구별할 수 있게 Identifiable과 UUID 만들어주기

<br>

```swift
// 다른 뷰 그리기

HStack {
        BlurStackView {
            HStack {
                Image(systemName: "thermometer.medium")
                Text("FEELS LIKE")
            }
            
        } contentView: {
            VStack (alignment: .leading) {
                Text("3°")
                    .font(.title)
                Spacer()
                Text("Wind is making it feel colder.")
            }
        }
        
        BlurStackView {
            HStack {
                Image(systemName: "humidity")
                Text("HUMIDITY")
            }
            
        } contentView: {
            VStack (alignment: .leading)  {
                Text("71%")
                    .font(.title)
                Spacer()
                Text("The dew point is -1° right now.")
            }
    }
```
- 정사각형의 모양의 View를 만들어주기 위해 HStackdp BlurStackView를 2개 넣었다.


<br>

## 자연스럽게 사라지게 하기

```swift
// BlurStackView
private func getOpacity() -> CGFloat {
        if bottomOffset < 35 {
            let progress = bottomOffset / 35
            return progress
        } else {
            return 1
        }
    }
```
- getOpacity 함수를 만들어 bottomOffset 값이 35보다 작을 때 opacity 값을 bottomOffset / 35 로 하여 점점 사라지게 하는 효과를 준다.

<br>

## 코드정리

```swift
import SwiftUI

struct TitleLabel: View {
    
    let titleText: String
    
    var body: some View {
        Text(titleText)
            .font(.title)
    }
}

struct TitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        TitleLabel(titleText: "sample")
    }
}


// 실제 사용
TitleLabel(titleText: "71%")

```
- font 크기가 title인 것들을 한번에 관리하기 쉽게 따로 View를 만들어줌

<br>

```swift
    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView {
                MainWeatherView()
                // 생략
            }
        }
    }
 
```
- BackgroundView(), MainWeatherView()를 함수로 만들어 ZStack의 구조를 보기 쉽게 만들어줌
- @ViewBuilder

```swift
    @ViewBuilder
    func BackgroundView() -> some View {
        GeometryReader { geometry in
            Image("cloud")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func MainWeatherView() -> some View {
        VStack {
            if offset < 50 {
                Text("Daejeon")
                    .font(.title)
            } else {
                VStack {
                    Text("Daejeon")
                        .font(.title)
                    HStack {
                        Text("6°")
                            .font(.title3)
                        Text("Cloudy")
                            .font(.title3)
                    }
                }
            }
            
            Text("6°")
                .font(.system(size: 100, weight: .thin))
                .opacity(setOpacity())
            Text("Cloudy")
                .font(.title3)
                .opacity(setOpacity())
            HStack {
                Text("H:9°")
                    .font(.title3)
                    .opacity(setOpacity())
                Text("L:-4°")
                    .font(.title3)
                    .opacity(setOpacity())
            }
        }
        .offset(y: -offset + 70)
        .foregroundColor(.white)
        .background(
            GeometryReader(content: { geometry ->
                Color in
                let minY = geometry.frame(in: .global).minY
                DispatchQueue.main.async {
                    offset  = minY
                }
                return Color.clear
            })
        )
    }
```