# LEVEL2 하나씩 꺼내먹는 SwitfUI
> LEVEL1에 이어서 16번으로 시작

## 26. NavigationView
```swift
NavigationView {
    NavigationLink("Navigate") {
        Text("안녕하세요")
      }
}
```
- 유저가 앱을 navigate하면서 화면 이동을 할 수 있게 해주는 View
- NavigationLink는 NavigationView의 **다음 View**로 넘어갈 수 있게 해주는 역할!
- title의 경우 NavigationView안에 있는 View에
- .navigationTitle("Title") 형태로 사용해야한다. 
<br>

> - iOS16부터는 NavigationStack과 NavigationSplitView 쓰라고 한다.

<br>

## 27. iOS16의 NavigationStack
```swift
NavigationStack {
    NavigationLink(value: 3) {
        Text ("test3")
        }.navigationDestination (for: Int.self) { value in
        Text ("Leeo tried \(value) times")
        }
    }
}
```  
- NavigationView 에서는 이 View에서 새로운 View로 넘어가는 느낌이었다면
- NavigationStack은 값을 넘겨주고 그 위에 쌓이는 메커니즘이 적용되어 보인다!