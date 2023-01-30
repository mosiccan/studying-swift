 # LEVEL2 클론코딩 - 설정앱

 ## UI 스케치, 프로필 뷰, 셀 디테일
 ```swift
@State private var isAirplaneModeOn: Bool = false
@State private var isVPNOn: Bool = false
    
NavigationView {
    List {
        Section {
            NavigationLink {
                Text("Profile")
            } label: {
                HStack {
                    Image(systemName: "tennisball")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 54, height: 54)
                        .background(.green)
                        .clipShape(Circle())
                    VStack (alignment: .leading) {
                        Text(" Woowon Kang")
                            .font(.title2)
                        Text("  Apple ID, iCloud, Media & Purchases")
                            .font(.system(size: 13))
                    }
                }
                .padding(.vertical, -5)
            }
        }
            
        Section {
            HStack {
                Image(systemName: "airplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.all, 5)
                    .background(.orange)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Toggle("  Airplane Mode", isOn: $isAirplaneModeOn)
            }
            HStack {
                Image(systemName: "wifi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.all, 5)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                NavigationLink {
                    Text("Display Screen Time")
                } label: {
                    HStack {
                        Text("  Wi-Fi")
                        Spacer()
                        Text("KT_GIGA_BE95")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        // 다른 NavigationLink들은 생략
        //
    }.navigationTitle("Settings")
}
```
- 전체를 Navigation으로 감싸고 List -> Section -> NavigationLink 구조
- HStack 안에 Toggle을 넣어줘 Airplane Mode나 VPN의 toggle을 구현
- NavigationLink의 label 값에 HStack을 넣어 텍스트를 배치
- profile의 이름(Woowon Kang)은 title2 크기로 설정

 <br>

 ## 리팩토링 1
```swift
plainCell(imageName: "gear",
          iconColor: .gray,
          cellTitle: "  General") {
    Text("Display General")
}

@ViewBuilder
private func plainCell<V: View>(imageName: String, iconColor: Color, cellTitle: String, destination: @escaping() -> V) -> some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(iconColor)
                .foregroundColor(.white)
                .cornerRadius(6)
            
            NavigationLink(cellTitle){
                destination()
        }
    }
}
```
- 중복되는 코드들을 함수화 해주었다.
- 현재로썬 이미지이름, 아이콘색, 텍스트, destination의 정보만 인자로 만들어 주면 된다.
- View를 인자로 넘길 땐 ```<V: View>``` 와 같은 형태로 써야하는 것 같다.
  - (위 개념 공부 할 것!)
<br>

<br>

## 리팩토링 2
```swift
@ViewBuilder
private func iconImage(imageName: String, iconColor: Color) -> some View {
    Image(systemName: imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20, height: 20)
        .padding(.all, 5)
        .background(iconColor)
        .foregroundColor(.white )
        .cornerRadius(6)
}

@ViewBuilder
private func toggleCell(imageName: String, iconColor: Color, cellTitle: String, isModeOn: Binding<Bool>) -> some View {
    HStack {
        iconImage(imageName: imageName, iconColor: iconColor)
        Toggle(cellTitle, isOn: $isAirplaneModeOn)
    }
}

@ViewBuilder
private func navigationLinkCell<V: View>(imageName: String, iconColor: Color,
                                cellTitle: String, subTitle: String? = nil,
                                destination: @escaping() -> V) -> some View {
    HStack {
        iconImage(imageName: imageName, iconColor: iconColor)
        if let subTitle = subTitle {
            NavigationLink{
                destination()
            } label: {
                HStack {
                    Text(cellTitle)
                    Spacer()
                    Text(subTitle)
                        .foregroundColor(.gray)
                }
            }
        } else {
            NavigationLink(cellTitle){
                destination()
            }
        }
        
        
    }
}
```
- 위와 같은 형태로 1번의 수정으로 관련된 여러파일을 한번에 수정할 수 있도록 코드를 만들었다.
- 예를 들어 여러 아이콘의 크기를 변경하고 싶을 때 각각의 아이콘마다 수정을 해주는 게 아니라 해당 기능을 함수로 묶어 처리한다.
- 다음에 변경하거나 추가할 때 좀 더 실수하지 않고 확실하게 할 수 있을지를 생각하면서 코드를 정리 하자!