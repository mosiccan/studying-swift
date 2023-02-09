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

<br>

## 12. struct, 구조체
```swift
struct userInfo {
    let name: String
    let age: Int?

    func sayMyName(with name: String ) {
        print(name)
    }
}
```
- struct 키워드로 시작
  - (함수는 func, 변수는 let, 열거형은 enum 등등,)
- 구조화 된 여러개의 정보를 한 번에!
 - 구조체가 갖고 있을 정보, 구조체가 행동할 함수가 있다. 


<br>

## 18. 함수와 메서드의 차이
- 함수
```swift
func name(parameter) -> return type {
    function body
}
```

<br>

- 메서드
- 함수보다 조금 작은 단위 
```swift

```
- 메서드 : **enum, struct, class 안에서** 사용되는 함수!
- 단순히 저 안에 들어있다고 해서 메서드로 볼 것인가?

```swift
func returnLeeo1() -> String {
    return "Leeo1"
}

struct MyMethod: View {
    var body: some View {
        Text(returnLeeo2())
    }
    func returnLeeo2() -> String {  // 메서드
        return "Leeo2"
    }
}
struct MyMethod_Previews: PreviewProvider {
    static var previews: some View {
        MyMethod()
        returnLeeo1()
        returnLeeo3()
        returnLee02()
    }
    func returnLee03() -> String {
        return "Leeo3"
    }
}
```
- returnLeeo2는 MyMethod struct에서 사용할 수 있지만
- MyMethod_Previews struct에서는 사용할 수 없다.