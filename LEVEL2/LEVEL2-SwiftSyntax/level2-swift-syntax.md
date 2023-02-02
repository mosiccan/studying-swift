# LEVEL2 SwiftUI로 배우는 Swift 문법의 기초
> LEVEL1에 이어서 10번으로 시작

## 10. optional
```swift
let name: String? = "Woowon"
```
- 타입 뒤에 ? 를 써주면 옵셔널 타입이 된다
```swift
let name: String = "Woowon"   // name이라는 변수는 문자열인데, Woowon을 담고있어 
let name: String? = "Woowon"   // name이라는 변수는 문자열인데, Woowon이 들어있을 수도 있고 아닐 수도 있다.

Text(name)
```
- 옵셔널 값을 Text에 담을 때 오류가 뜨게 되는데 
- Text는 변수를 받는데 그 변수가 반드시 어떤 값이 있을 때 반환하기 때문!
- 출력해주려면 변수값이 없을 때의 값을 정해줘야한다.
  - ?? 사용하기
  - if let 사용하기
```swift
// ?? 사용하기 
let age: Int? = 23
Text(age?.description ?? "100") 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(age: 30)
    }
} 
```

```swift
// if let 사용하기
let age: Int?
if let age = age {
    Text(age.description)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(age: nil)
    }
} 

// 화면엔 아무것도 출력되지 않는다.
```
- 어디에 사용해볼 수 있을지 연구해봐야겠다
  - 옵셔널이 적용되는 앱을 생각해보자!