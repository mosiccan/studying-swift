# LEVEL1 클론코딩 - 키패드앱

## 화면 그리기
- 기본 구상
```swift
VStack {
    HStack {
        Button {
            
        } label: {
            Text("1")
                .foregroundColor(.white)
                .font(.system(.title))
                .frame(width: 65, height: 65)
                .background(.gray)
                .clipShape(Circle())
                
        }
        Button {
            
        } label: {
            VStack {
                Text("2")
                    .font(.system(.title))
                HStack {
                    Text("A B C")
                        .font(.system(size: 11))
                        .bold()
                }
            }
            .foregroundColor(.white)
            .frame(width: 65, height: 65)
                .background(.gray)
                .clipShape(Circle())
        }
        Button {
            
        } label: {
            VStack {
                Text("3")
                    .font(.system(.title))
                HStack {
                    Text("D E F")
                        .font(.system(size: 11))
                        .bold()
                }
            }
            .foregroundColor(.white)
            .frame(width: 65, height: 65)
                .background(.gray)
                .clipShape(Circle())
                
        }

        // SF Symbols - phone.fill
        Button {
                    
        } label: {
            VStack {
                Image(systemName: "phone.fill")
                    .resizable()
                        .frame(width: 25.0, height: 25.0)
            }
            .foregroundColor(.white)
            .frame(width: 65, height: 65)
                .background(.green)
                .clipShape(Circle())
        }
    }
}
```
- 계산기 만들었던 것을 생각해보며 배치와 색 등을 구체화 해보자!


<br>

## 다이얼 버튼
```swift
// DialButton

import SwiftUI

struct DialButton: View {
    
    let dialNumber: Dial
    
    var body: some View {
        
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Text(dialNumber.mainNumber)
                    .font(.system(.title))
                    .padding(.vertical, -3)
                HStack(spacing: 3 ) {
                    ForEach(dialNumber.subAlphabet, id: \.self ) { item in
                     Text(item)
                            .font(.system(size: 11))
                            .bold()
                    }
                }
            }
            .foregroundColor(.white)
            .frame(width: 65, height: 65)
                .background(.gray)
                .clipShape(Circle())
        }
         
    }
}

struct DialButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

```

```swift
// Dial

import Foundation

struct  Dial: Identifiable, Hashable {
    var id = UUID()
    var mainNumber: String
    var subAlphabet: [String]
   
}

var dialDummy = [Dial(mainNumber: "1",
                      subAlphabet: ["" ]),
                 Dial(mainNumber: "2",
                                       subAlphabet: ["A", "B", "C"]),
                 Dial(mainNumber: "3",
                                       subAlphabet: ["D", "E", "F"]),
                 Dial(mainNumber: "4",
                                       subAlphabet: ["G", "H", "I"]),
]
```

```swift
// ContentView

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack {
                ForEach(dialDummy, id: \.self) { item in
                    DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
                }
            } 
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

```

### 다이얼 버튼 배치 Woowon.ver
```swift
VStack {
    HStack {
        ForEach(dialDummy[0...2], id: \.self) { item in
            DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
        }
    }
    HStack {
        ForEach(dialDummy[3...5], id: \.self) { item in
            DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
        }
    }
    HStack {
        ForEach(dialDummy[6...8], id: \.self) { item in
            DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
        }
    }
    HStack {
        ForEach(dialDummy[9...11], id: \.self) { item in
            DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
        }
    }
    HStack {
        ForEach(dialDummy.suffix(1), id: \.self) { item in
            DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
        }
    }
}
```
- dialdummy에 어떻게 3개씩 잘라서 접근할까 고민을 했고 배열인 점을 이용하여 해당 범위 [a...b]를 입력해주었다.
- 마지막 휴대폰 모양 하나는 suffix(1)로 마지막 원소 하나를 가져왔다.
- HStack으로 가로를 3개씩 출력해주고 바깥 View layout은 VStack으로 하여 쌓아줬다.