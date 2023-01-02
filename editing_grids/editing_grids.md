## Editing Grids
> 격자 편집

<br>

### 식별할 수 있는 유형 정의하기
```swift
    struct Symbol : Identifiable, Equatable {
    var id = UUID()
    var name : String
}
```
- 단일 SF Symbol을 나타내는 데이터 모델
- ```Identifiable``` 프로토콜
  - 여러 기호가 동일한 name 문자열을 사용해도 기호의 ```id``` 값에 따라 격자의 각 셀을 고유하게 식별할 수 있다.

<br>

### 기호 세부사항 보기 생성하기
```swift
    Image(systemName: symbol.name)
```
- 위 같은 형태로 ```name```으로 ```symbol```을 가져옴


```swift
    Image(systemName: symbol.name)
        .resizable()
        .scaledToFit()
        .symbolRenderingMode(.hierarchical)
        .foregroundColor(.accentColor)
```
- 다음과 같은 제어자들로 **스타일 및 동작 방식**을 변경할 수 있음