# LEVEL3 하나씩 꺼내먹는 SwitfUI
>

## 43. 뷰를 추출해서 따로 빼는 방법 ViewBuilder
- LEVEL3 Weather에서 @ViewBuilder 사용하는 것을 보고 개념을 이해하고자

```swift
@ViewBuilder
func passLabel() -> some View {
    Label {
        Text("Pw")
    } icon: {
        Image(systemName: "lock.fill ")
    }
}
```
- View를 그대로 다 적지 않고 @ViewBuilder 함수 형태로 빼서 사용하기 위한 역할
- 적당히 사용한다면 코드 전체 구조 (특히 레이아웃)를 보기에 수월할 듯 하다.