 # LEVEL2 클론코딩 - 팁앱

 ## 화면 그리기

 - 새로 알게된 점 SwiftUI는 기본적으로 webp파일을 이미지로 불러올 수 없는 것 같다. 

```swift
NavigationStack {
    List {
        ZStack {
            Image("iphone-14")
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 200)
                
            Text("Navigate your iPhone")
                .offset(x: -64, y: -90)
                .bold()
                .font(.title3)
        }
       
        Section {
            NavigationLink {
                Text("Detail Protect your information")
            } label: {
                Label("Protect your information",
                      systemImage: "lock.shield")
            }
            /// 생략
        } header: {
             Text("Get Started")
        }
    }.navigationTitle("Collections")
}
```
- 전반적으로 위와 같은 구조
- 반복문 및 함수를 사용해서 코드를 보기 좋게 만들어 줄 수 있을 것 같다.

<br >

## 화면 완성
```swift
.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "검색")
```
- 위 코드를 사용하여 페이지를 내려도 searchbar가 위에 계속 띄울 수 있다.
- prompt를 사용하여 기본값외에 다른 값으로 표기할 수 있다.

<br>

```swift
Section {
    NavigationLink {
        Text("Detail Personalize your iPhone")
    } label: {
        Label("What's new in iOS16",
              systemImage: "sparkles")
    }
} header: {
     Text("Discover More")
        .foregroundColor(.white)
        .textCase(nil)
        .bold()
        .font(.title3)
}
```
- 영어의 경우 Section의 header에 적용된 Text가 기본적으로 uppercase가 적용되어 있다.
-  .textCase(nil)를 적용해주면 해결된다!

<br>

```swift
HStack {
    Image(systemName: "camera")
        .resizable()
        .foregroundStyle(.linearGradient(colors: [.orange, .yellow], startPoint: .bottomLeading, endPoint: .bottomTrailing))
        .scaledToFit()
        .frame(width: 20 , height: 20)
    Text("Camera")
        .padding(.leading, 10)
}
```
- Image의 크기는 20, Text의 padding은 (.leading, 10)로 실제 앱과 유사하게 배치를 해보았다.

<br>

## 상세화면 그리기

```swift
// ContentView
 NavigationLink {
    ProtectInformationDetail()
}
```
- Section의 한 NavigationlLink를 개별 View로 생성해주었다.

<br>

```swift
// ProtectInformationDetail

VStack {
    ZStack {
        Rectangle()
            .frame(height: 230)
            .foregroundStyle(LinearGradient(stops: [
                Gradient.Stop(color: .green, location: 0.01),
                Gradient.Stop(color: .blue, location: 0.99)
            ], startPoint: .leading, endPoint: .trailing))
        VStack {
            Image(systemName: "person.badge.shield.checkmark.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Protect your information")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical, 1)
            Text("Learn how iPhone keeps your ingormation secure and private.")
                .foregroundColor(Color(UIColor.systemGray))
                .multilineTextAlignment(.center)
                .font(.system(size: 15))
        }
    }
    List {
        NavigationLink {
            Text("Detail  Add Face ID with a mask")
        } label: {
            HStack {
                Image(systemName: "iphone")
                VStack {
                    Text("Add Face ID with a mask")
                        .font(.title3)
                    Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternte appearance like glasses or...")
                        .multilineTextAlignment(.leading)
                }
            }
            
        }
        /// 중복 생략
    }
}
```
- Rectangle에 Gradient를 줄 때 stops를 이용해 조금 더 실제 앱과 비슷하게 구현해보고자 했다.
- 현재 적용된 것 보다 경계면이 좀 더 모호하게 되야할 것 같다.
- 현재 ProtectInformationDetail() View에서 드래그를 했을 때 Rectangle은 고정된다. 같이 움직이도록 해보자.

<br>

## 상세 페이지
```swift
VStack {
    Image(systemName: "person.badge.shield.checkmark.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Protect your information")
        .font(.title)
        .fontWeight(.bold)
        .padding(.vertical, 1)
    Text("Learn how iPhone keeps your ingormation secure and private.")
        .foregroundColor(Color(UIColor.systemGray))
        .multilineTextAlignment(.center)
        .font(.system(size: 15))
}
.frame(height: 400)
.padding(.leading, 8)
.listRowBackground(LinearGradient(stops: [
    .init(color: Color(UIColor.systemGreen), location: 0),
    .init(color: Color(UIColor.systemTeal), location: 1)
], startPoint: .leading, endPoint: .trailing).mask(LinearGradient(stops: [
    .init(color: .black, location: 0),
    .init(color: .clear, location: 1)
], startPoint: .top, endPoint: .bottom)))
```
 - listRowBackground를 사용하여 list의 양쪽 영역도 전부 배경이 채워지게 했다.
 - LinearGradient에 .mask를 적용하여 위에서 아래로 어두워지는 효과를 넣었다.

```swift
NavigationLink {
    Text("Detail Add Face ID with a mask")
} label: {
    HStack {
        Image("addFaceIDwithAMaskIcon")
            .resizable()
            .frame(width: 100, height: 100)
            .scaledToFit()
            .padding(.leading, -3)
        Spacer()
        VStack(alignment: .leading) {
            Text("Add Face ID with a mask")
                .font(.callout)
                .fontWeight(.medium)
                .padding(.vertical, 0.1)
            
            Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternte appearance like glasses or...")
                .foregroundColor(Color(UIColor.systemGray))
                .font(.system(size: 12))
        }.lineSpacing(4)
    }
}

```
- VStack은 .leading으로 왼쪽 정렬해주고
- lineSpacing 값도 4정도로 해주어 줄 간격을 맞춰주었다.
- Text font는 .callout과 weight는 medium으로 했을 때 가장 똑같은 것 같다.

<br>

```swift
List {
    /// 생략
}
.listStyle(.inset)
.navigationBarTitleDisplayMode(.inline)
.edgesIgnoringSafeArea(.top)
```
- edgesIgnoringSafeArea(.top)을 해주어 위쪽 영역도 배경이 보이게 해주었다.

<br>

## 상세의 상세
```swift
// ProtectInformationDetail
NavigationLink {
    FaceIDWithAMaskDetail()        
}
``` 

```swift
// FaceIDWithAMaskDetail

VStack {
    Spacer()
    Image("example1")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 240)
        .padding(.bottom, 30)
    
    VStack(alignment: .leading){
        Text("Add Face ID with a mask")
            .font(.title3)
            .bold()
            .padding(.bottom, 3)
        Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternate appearance, like glasses or a mask, go to Setings, then tap Face ID & Passcode.")
            .font(.system(size: 15))
    }
    .lineSpacing(4)
    .frame(width: 320)
    
    Spacer()
    
    Button {
        //
    } label: {
        Text("Review Face ID Settings")
            .font(.system(size: 16))
    }
    .frame(width: 200, height: 40)
    .background(Color(UIColor.systemGray6))
    .cornerRadius(24)
    
    Spacer()
    
    PageControl(numberOfPages: 6, currentPage: $selectedPage)
}
.navigationTitle("Protect your information")
.toolbar {
    Button {
        // clicked bookmark
    } label: {
        Image(systemName: "bookmark")
    }
}

```

<br>

- PageControl; 점 모양으로 페이지 표시

```swift
struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    var body: some View {
        HStack {
            ForEach(0 ..< numberOfPages) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(index == self.currentPage ? .white : .gray)
                    .padding(.horizontal, 2)
                    .onTapGesture (perform: {
                        self.currentPage = index
                    })
                
            }
        }
    }
}
```

<br>

## 페이지 표시
```swift
ScrollView {
    HStack {
        TabView {
            VStack{ 
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-60)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

```
- ScrollView와 TabView를 이용해서 옆으로 드래그가 가능하게 해준다.
- 가로 영역을 정할때 처음엔 frame에 ```.infinity``` 로 생각했지만, 다른 기기에서는 잘릴 수 있다고 한다.
- 따라서 ```.UIScreen.main.bounds.width``` 가 모든 기기에서 동일하게 화면의 가로 영역을 정해줄 수 있다.
- ```.tabViewStyle(.page(indexDisplayMode: .always))``` 를 사용해서 indicator가 보이게 해준다...! 

- 현재 코드에선 tabbar부분 indicator 위치가 고정이 안된다. 이를 해결해야한다!

<br>

## 데이터 모델링
```swift
struct Collection: Identifiable {
    var id = UUID()
    let symbolName: String
    let symbolColor: [Color]
    let title: String
}
```
- Identifiable에 꼭 필요한 id
- 각 NavigationLink 에서 구분할 수 있는 요소는 symbolName, symbolColor, title

<br>

```swift
var startList: [Collection] = [Collection(symbolName: "lock.shield",
                                      symbolColor: [.blue, .green],
                                      title: "Protect your information"),
                               Collection(symbolName: "lifepreserver",
                                      symbolColor: [.orange, .yellow],
                                      title: "Be prepared"),
                               Collection(symbolName: "star",
                                      symbolColor: [.red, .orange],
                                      title: "Set up essentials"),
                               Collection(symbolName: "heart",
                                      symbolColor: [.purple, .pink],
                                      title: "Personalize your iPhone")]
```
- 실제 값들을 지정해준다.

```swift
Section {
    ForEach(startList) { list in
        NavigationLink {
            ProtectInformationDetail()
                .background(Material.thick)
        } label: {
            HStack {
                Image(systemName: list.symbolName)
                    .resizable()
                    .foregroundStyle(.linearGradient(colors: list.symbolColor, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .scaledToFit()
                    .frame(width: 20 , height: 20)
                
                Text(list.title)
                    .padding(.leading, 10)
            }
        }
    }
} header: {
    Text("Get Started")
        .foregroundColor(.white)
        .textCase(nil)
        .bold()
        .font(.title3)
}
```
- struct - list - ForEach로 데이터를 가져와서 간소화하기