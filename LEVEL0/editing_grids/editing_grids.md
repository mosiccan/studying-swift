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


<br>

### 탐색 격자 만들기
```swift
    @State private var symbols = [
        Symbol(name: "tshirt"),
        Symbol(name: "eyes"),
        Symbol(name: "eyebrow"),
        Symbol(name: "nose"),
        Symbol(name: "mustache"),
        Symbol(name: "mouth"),
        Symbol(name: "eyeglasses"),
        Symbol(name: "facemask"),
        Symbol(name: "brain.head.profile"),
        Symbol(name: "brain"),
        Symbol(name: "icloud"),
        Symbol(name: "theatermasks.fill"),
        //#-learning-code-snippet(3.addSymbol)
    ]
```
- ```@State```로 표시하여 SwiftUI에서는 해당 값에 대한 저장 공간을 관리함
- 해당 상태 속성이 변경될 때마다 SwiftUI는 해당 값(여기서는 해당 격자)을 사용하여 모든 보기를 업데이트 함
- 위 배열에 Symbol을 추가하거나 제거하면 업데이트됨


### 격자에 항목 추가하기
```swift
.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingSymbol = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
.sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
            SymbolPicker(symbol: $selectedSymbol)
        }
```

### 격자에서 항목 삭제하기
```swift
.overlay(alignment: .topTrailing) {
                            if isEditing {
                                Button {
                                    remove(symbol: symbol)
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                        .font(.title)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, Color.red)
                                }
                            }
                        }
```
- overlay를 LazyVGrid안에 있는 NavigationLink의 label 아래에 붙여주기
