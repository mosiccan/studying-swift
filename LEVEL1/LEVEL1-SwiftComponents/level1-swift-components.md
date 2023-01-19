# LEVEL1 - 하나씩 꺼내먹는 SwitfUI

<br>

## 1. Button
- 일반적인 Button
```swift
Button {
    <#code#>    // Action
} label: {
    <#code#>    // Label
}
```
- code 부분에 ```View```라고 하는 것들을 넣을 수 있다.

```swift
    Button("Button", role: .destructive)
```
- ```role``` : 역할 지정
  - .destructive : 말그대로 파괴 역할을 표시하기 위해, 빨간색!

<br>

## 2. Text
```swift
    Text("Wow")
```

```swift
    Text("Wow")
        .bold()
        .strikethrough()

```

```swift
    Text("Wow")
        .font(.headline)
        .font(.system(size: 30))
        .underline(true, color: .red)   // 밑줄만 빨간색으로
        .foregroundColor(.brown)
```

<br>

## 3. Image
```swift
    Image(name: String)
```

```swift
    Image(name: String)
        .resizable()    // frame안에 맞게 들어감
        .aspectRatio(contentMode: .fill)    // 먼저 비율 정해줌
        // fill : frame안에 꽉 차며 over될 수 있음, fit : 이미지가 잘리지 않음  
        .clipped()  // 이미지 튀어나온 부분 정리해줌
        .frame(width: 100, height: 100)     
```

```swift
    Image(systemName: "heart.fill") // SF Symbol 사용 : 애플에서 기본적으로 제공해주는 Symbols들
```
- 앱스토어 앱 중에 'Symbols Explorer'을 설치해서 이름과 모양을 볼 수 있다.


<br>

## 4. Stack (VStack, HStack, ZStack )
```swift
// 수직으로 쌓기
    VStack {        
        Text("1")
        Text("2")
        Text("3")
    } 
```

```swift
// 가로로 쌓기
    HStack {    // 1 2 3
        Text("1")
        Text("2")
        Text("3")
    } 
```

```swift
// 곂쳐서 위에 쌓기
    ZStack {    
        Text("1")   // 가장 밑에 깔려있음
        Text("2")
        Text("3")   // 가장 위에 있어서 보임
    } 
    // 레이어 개념?
```

```swift
VStack(alignment: .trailing) {
    Text("This is some text")
    Text("This is some longer text")
    Text("This is short")
}
// 출력
//             This is some text
//      This is some longer text
//                 This is short

```

- 각 Stack에는 10개까지만 arguments들이 들어갈 수 있다.

<br>

## 5. ScrollView
```swift
// 기본 세로 스크롤
    ScrollView {
        Text("This is some text")
            .frame(width: 300, height: 500)
            .background(.red)
        Text("This is some longer text")
            .frame(width: 300, height: 500)
            .background(.green)
        Text("This is short")
            .frame(width: 300, height: 500)
            .background(.blue)
    }
```

```swift
// 가로로 스크롤 하려면?
ScrollView(.horizontal) {   // .horizontal 적용 후
    HStack {    // 이 경우엔 HStack으로 배치 또한 가로로 해주면 더 정확하다.
        Text("This is some text")
            .frame(width: 300, height: 500)
            .background(.red)
        Text("This is some longer text")
            .frame(width: 300, height: 500)
            .background(.green)
        Text("This is short")
            .frame(width: 300, height: 500)
            .background(.blue)
    }
}
```

```swift
// 가로로 스크롤 하려면?
ScrollView(.horizontal) {   
    HStack (spacing: 0){    // spcaing을 0으로 해주면 기본 여백 없이 모두 붙어서 이어져 있다.    
        Text("This is some text")
            .frame(width: 300, height: 500)
            .background(.red)
        Text("This is some longer text")
            .frame(width: 300, height: 500)
            .background(.green)
        Text("This is short")
            .frame(width: 300, height: 500)
            .background(.blue)
    }
}
```

<br>

## 6. UITableView와 닮은 List로 리스트 만들기 

```swift
// List
// 정적인 형태
List {
    HStack {
        Image(systemName: "figure.tennis")
            .foregroundColor(.black)
        Text("Tennis")
    }
    HStack {
        Image(systemName: "tennisball")
            .foregroundColor(.black)
        Text("Tennis")
    }
    HStack {
        Image(systemName: "bolt")
            .foregroundColor(.black)
        Text("Tennis")
    }
}
```

```swift
let names: [String] = ["Djokovic","Federer","Nadal"]
        
        List (names, id: \.self) { name in  // id를 넣어주는 이유는 배열에 같은 값으로 있을 때도 식별 가능하도록 하기 위해서!
            Text(name)
        }
```

```swift
// 좀 더 구조화 해보자
struct Person: Identifiable {
    var id = UUID() // UUID 를 사용하면 매번 객체가 생성될 때 Unique Identifier 를 만들 수 있다
    let name : String
}

struct ContentView: View {
    var body: some View {
        
        let people: [Person] = [Person(name: Djokovic),
                                Person(name: Federer),
                                Person(name: Nadal),]
        List(people) { person in
            Text(person.name)
        }
    }
}
```

<br>

## 7. List안에서 구역을 나눠주는 Section
```swift
List {
    Section {
        HStack {
            Image(systemName: "crown.fill")
            Text("Djokovic")
        }
        HStack {
            Image(systemName: "crown.fill")
            Text("Federer")
        }
        HStack {
            Image(systemName: "crown.fill" )
            Text("Nadal")
        }
    }
   
    Section {
        HStack {
            Image(systemName: "crown")
            Text("Auger Aliassime")
        }
        HStack {
            Image(systemName: "crown")
            Text("Sinner")
        }
        HStack {
            Image(systemName: "crown")
            Text("Shapovalov")
        }
    }
}
```
### header, footer
```swift
Section {
    HStack {
        Image(systemName: "crown.fill")
        Text("Djokovic")
    }
    HStack {
        Image(systemName: "crown.fill")
        Text("Federer")
    }
    HStack {
        Image(systemName: "crown.fill")
        Text("Nadal")
    }
} header: {
    Text("Big 4")
} footer: {
    Text("")
}
```
- ```header```와 ```footer``` 를 정해줄 수 있다.
- ```header```에 현재 Section의 이름 같은 값을 붙여주자.
- 또한 대문자로 출력이 된다!  
<br>  

- ```footer```에는 상황에 따라 출처라던가, 현 섹션의 개수라던가 하는 값을 넣어주면 적당할 것 같다.

<br>

## 8. 컴포넌트 사이의 공간을 만들어주는 Spacer
```swift
VStack() {
    Image(systemName: "crown.fill")
    Spacer()
    Text("Djokovic")
}
```
- 적응성 있는 뷰를 생성하며 가능한 크게 공간을 만든다
- 최대로 비율에 맞게 적응형으로 공간을 늘릴 수 있다.

<br>

## 9. 색상을 그려주는 Color
```swift
    Color(.green)

    Color(.green).edgesIgnoringSafeArea(.bottom)
    // .edgesIgnoringSafeArea를 통해 safe-area에도 그릴 수 있다.
```
- ```safe-area``` 부분을 제외하고 전부 해당 색으로 칠한다!

<br>

## 10. UI를 그릴 때는 View (간단)
```swift
struct ContentView: View {
    var body: some View {
        Text("Woowon")
    }
}
    
```
- body가 존재한다.
- View 타입에 맞는 형태만 넣을 수 있다.

<br>

## 11. 앱 화면을 다시 그리기 위한 상태 @State 
```swift

struct ContentView: View {
    @State var name: String = ""

    var body: some View {
        VStack {
            Text("Hi \(name)")
                .font(.title)
            Button {
                name = "Woowon"
            } label: {
                Text("Click")
            }
        }
    }
}


```
### 왜 쓰는지
- struct는 자료를 바꾸기 어렵다.
- 바꿔주기 위해 @State를 사용한다.

<br>

## 12. View의 설정? 옵션? modifier에 대해 알아보자
```swift
    Image(systemName: "tennisball")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            .foregroundColor(.green)
```
- Image아래 .resizable() 등 붙어있는 옵션들을 말한다. 
- 각 modifier를 보면 부모에 해당하는 View를 다시 반환한다.

<br>

## 13. 컴포넌트 사이에 공간을 주는 padding
```swift
VStack {
    Image(systemName: "tennisball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(.green)
                .padding(30)
    Image(systemName: "tennisball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(.green)
}

```
- 수치를 넣으면 해당 값의 points만큼 간격을 만든다.
- bottom, top등 원하는 위치에 넣을 수도 있다.
- 만약 버튼을 만들었는데 padding을 지정한 영역만큼 버튼으로 인식하기에 이런 부분도 잘 고려를 해야한다.

## 14. 컴포넌트의 사이즈를 잡아주는 frame
```swift
Image(systemName: "tennisball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
```
- width, height를 각각 정해줄 수 있고 alignment도 가능하다.