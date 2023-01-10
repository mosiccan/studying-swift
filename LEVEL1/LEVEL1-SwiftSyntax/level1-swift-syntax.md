# LEVEL1 SwiftUI로 배우는 Swift 문법의 기초

## 1, 2 변수

```swift
let name = "Woowon"
```
- 우항(Woowon)의 값을 좌항(name)에 저장한다.

<br>

### 변수의 종류
```swift
String 
Int
Float
Bool
...
```
- String
  - 문자열
- Int
  - 정수, 64비트
- Float
  - 소수점, 32비트 부동소수점
- Bool
  - true, false

<br>

**타입 명시해주기**
```swift
let age: Int = 23
```
- 변수명 뒤에 콜론(:)을 붙여주고 자료형을 써준다. 

<br>

## 3. 연산자
- 대입 연산자
- 사칙 연산자
- 비교 연산자

<br>

### 대입 연산자
- 오른쪽에 있는 값을 왼쪽으로 넣어주는 연산자
- ```=``` 

<br>

### 사칙 연산자
```swift
+
-
*
/
%
```

<br>

### 비교 연산자
```swift
<
>
<=
>=
== 
!=


let num1 = 3
let num2 = 5

Text("\(num1 < num2)".description)  // true
// .description을 붙여줘야 출력이 된다.
```
- 결과가 항상 ```bool``` 값이다. 

<br>

## 4. 여러개의 변수를 모아서 쓰는 콜렉션 타입
 
### Array (배열)
- repeating 메소드와 count 메소드를 이용해 기본 값으로 빈 배열을 생성할 수 있다.
```swift
var threeIntegers = Array(repeating: 0, count: 3)
// Int [0, 0, 0]
```
- let names = ["Woowon1", "Woowon2", "Woowon3"]

<br>

### Dictionary (사전)
```swift
var engKrDictionary = ["Apple":"사과", "Banana":"바나나"]

// 출력
Text(engKrDictionary["Apple"]!)     // 사과

```

<br>

### Set (집합)
```swift
var animals: Set = ["🐶", "🐈", "🐹"]
var animals: Set = ["🐴", "🐈", "🐹", "🐹", "🐹"]
```
<br>

- Set끼리의 교집합 구하기 : .intersection(다른Set).decription
```swift
Text(animals1.intersection(animals2).description)
//  "🐈", "🐹"
```
- Set끼리의 합집합 구하기 : .intersection(다른Set).decription
```swift
Text(animals1.union(animals2).description)
//  ["🐹", "🐶", "🐈", "🐴"]
// 중복 값은 사라지는 것으로 보인다.
```

<br>

## 5. 조건을 가지고 분기를 하는 조건문
```swift
if condition {
    code
} else {

}

var randomNumber: Int = 3
    
    var body: some View {
        VStack {
            if randomNumber % 2 == 0 {
                Text("짝수")
            } else {
                Text("홀수")
            }
        }
        .padding()
    }
```

<br>

## 6. 같은 것을 반복해주는 반복문
```swift
let farmAnimals = ["🐴", "🐮", "🐷", "🐑"]
    
    var body: some View {
        VStack {
            ForEach(farmAnimals,
                    id: \.self) { animal in
                 Text(animal)
            }
        }
        .padding()
    }
```

```swift
ForEach(0 ..< 5) { number in
    Text(number.description)
}

// 0
// 1
// 2
// 3
// 4


// 범위 출력
ForEach(0 ..< 5) { number in
    Text(farmAnimals[number])
}


// 전체 출력
ForEach(farmAnimals, id: \.self) { s in
    Text(s)
}
```

<br>


## 7. func, 코드를 따로 뺄 수 있도록 해주는 함수
```swift
Text(myMind)
Button {
    isChangedMind.toggle()
    myMind = getMind(with: isChangedMind)
} label: {
    Text("Change my mind!")
}

func getMind(with isChangedMind: Bool) -> String {  
    if isChangedMind {
        return "always open"
    } else {
        return "but closed"
    }
}
```
- func getMind 함수에서
- with isChangedMind의 isChangedMind는 받아온 값을 저장한 변수이다.

<br>

## 8. enum, 선택지를 만들어주는 열거형
```swift
enum Big4 {
    case Djokovic
    case Nadal
    case Federer
    case Murray
}

```

<br>

## 9. switch, 케이스의 패턴으로 나눠주는 스위치
```swift
switch menu {
case .Beef :
    Text("오늘 메뉴는 🐮")
case .Pork :
    Text("오늘 메뉴는 🐷")
case .Chicken :
    Text("오늘 메뉴는 🍗")
default:
    Text("이건 못먹어요")
}
```

<br>

> 추가 팁
- let : 상수
- SwiftUI에서 VStack 안에는 직접적인 자식 뷰의 수가 10개를 넘길 수 없다.
- " " 안에 \(변수이름)을 넣어주면 **문자열이 아닌** 변수로 인식해준다.
```swift
Text("\(name)")
```