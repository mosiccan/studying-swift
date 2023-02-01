 # LEVEL2 클론코딩 - 팁앱

 ## 화면 그리기

 - 새로 알게된 점 SwiftUI는 기본적으로 webp파일을 이미지로 불러올 수 없는 것 같다. 

```swift
NavigationStack {
    List {
        ZStack {
            Image("iphone-14")
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 200)
                
            Text("Navigate your iPhone")
                .offset(x: -64, y: -90)
                .bold()
                .font(.title3)
        }
       
        Section {
            NavigationLink {
                Text("Detail Protect your information")
            } label: {
                Label("Protect your information",
                      systemImage: "lock.shield")
            }
            /// 생략
        } header: {
             Text("Get Started")
        }
    }.navigationTitle("Collections")
}
```
- 전반적으로 위와 같은 구조
- 반복문 및 함수를 사용해서 코드를 보기 좋게 만들어 줄 수 있을 것 같다.

<br >

## 화면 완성
```swift
.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "검색")
```
- 위 코드를 사용하여 페이지를 내려도 searchbar가 위에 계속 띄울 수 있다.
- prompt를 사용하여 기본값외에 다른 값으로 표기할 수 있다.

```swift
Section {
    NavigationLink {
        Text("Detail Personalize your iPhone")
    } label: {
        Label("What's new in iOS16",
              systemImage: "sparkles")
    }
} header: {
     Text("Discover More")
        .foregroundColor(.white)
        .textCase(nil)
        .bold()
        .font(.title3)
}
```
- 영어의 경우 Section의 header에 적용된 Text가 기본적으로 uppercase가 적용되어 있다.
-  .textCase(nil)를 적용해주면 해결된다!

```swift
HStack {
    Image(systemName: "camera")
        .resizable()
        .foregroundStyle(.linearGradient(colors: [.orange, .yellow], startPoint: .bottomLeading, endPoint: .bottomTrailing))
        .scaledToFit()
        .frame(width: 20 , height: 20)
    Text("Camera")
        .padding(.leading, 10)
}
```
- Image의 크기는 20, Text의 padding은 (.leading, 10)로 실제 앱과 유사하게 배치를 해보았다.