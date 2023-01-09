# LEVEL1 SwiftUI로 배우는 Swift 문법의 기초

## 변수

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

## 연산자
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

## 여러개의 변수를 모아서 쓰는 콜렉션 타입
 
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

> 추가 팁
- let : 상수
- SwiftUI에서 VStack 안에는 직접적인 자식 뷰의 수가 10개를 넘길 수 없다.
- " " 안에 \(변수이름)을 넣어주면 **문자열이 아닌** 변수로 인식해준다.
```swift
Text("\(name)")
```
