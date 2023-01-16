# LEVEL1 - 하나씩 꺼내먹는 SwitfUI

<br>

## Button
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

## Text
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

## Image
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

## Stack (VStack, HStack, ZStack )
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

## ScrollView
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

## UITableView와 닮은 List로 리스트 만들기 

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