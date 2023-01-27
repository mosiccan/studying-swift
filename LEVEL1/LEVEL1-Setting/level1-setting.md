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
```

 <br>

