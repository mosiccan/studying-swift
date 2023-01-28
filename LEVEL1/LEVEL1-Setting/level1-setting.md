 # LEVEL1 클론코딩 - 설정앱

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

