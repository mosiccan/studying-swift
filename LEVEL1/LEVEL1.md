# LEVEL1 하나씩 꺼내먹는 SwiftUI

## Button
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                print("안녕2")    // Action
            } label: {
                Text("Hi")  // Label
                    .padding()  
                    .background(.blue)
                    // padding을 먼저 썼기 때문에 크기를 늘린 상태에서 background 색을 입힘
            }

        }
    }
}
```