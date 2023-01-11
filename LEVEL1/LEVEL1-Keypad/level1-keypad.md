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

<br>

## 버튼 나열
### 리이오님의 다이얼 버튼 배치!
```swift
// ContentView
VStack {
    ForEach(dialDummy, id: \.self) { items in
        HStack {
            ForEach(items, id: \.self) { item in
                DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
            }
        }
    }
    
}
```
- 이중 반복문으로 코드 길이를 줄이셨다.
- 3개씩 버튼을 묶어 HStack들을 반복문을 통해 출력! 

```swift
// Dial
var dialDummy = [[Dial(mainNumber: "1",
                       subAlphabet: [""]),
                  Dial(mainNumber: "2",
                       subAlphabet: ["A", "B", "C"]),
                  Dial(mainNumber: "3",
                       subAlphabet: ["D", "E", "F"])],
                 [Dial(mainNumber: "4",
                       subAlphabet: ["G", "H", "I"]),
                  Dial(mainNumber: "5",
                       subAlphabet: ["J", "K", "L"]),
                  Dial(mainNumber: "6",
                       subAlphabet: ["M", "N", "O"])],
                 [Dial(mainNumber: "7",
                       subAlphabet: ["P", "Q", "R", "S"]),
                  Dial(mainNumber: "8",
                       subAlphabet: ["T", "U", "V"]),
                  Dial(mainNumber: "9",
                       subAlphabet: ["W", "X", "Y", "Z"])],
                 [Dial(mainNumber: "*",
                       subAlphabet: ["G", "H", "I"]),
                  Dial(mainNumber: "0",
                       subAlphabet: ["+"]),
                  Dial(mainNumber: "#",
                       subAlphabet: ["G", "H", "I"])],
                 [Dial(mainNumber: "c",
                       subAlphabet: [""])],         
]
```
- 대괄호를 보면 3개씩 묶여있는 것을 볼 수 있다.

<br>

## 버튼 누르기
```swift
// DialButton
@Binding var inputNumber: String    // @Binding

Button {
            inputNumber += dialNumber.mainNumber    // 더해주기!
} label: {
    VStack(spacing: 0) {
        // mainNumber
        if dialNumber.mainNumber == "Phone" {
            Image(systemName: "phone.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fill).frame(width: 30, height: 30)
        } else {
            Text(dialNumber.mainNumber)
                .font(.system(.title))
                .padding(.vertical, -3)
        }
        // subAlphabet
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
    .background(buttonColor)
    .clipShape(Circle())
}
.padding(.all, 6)
```

```swift
// ContentView
struct ContentView: View {
    
    @State var inputNumber: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(inputNumber)   // inputNumber로 바꿔주기
                    .font(.system(size: 32))
                    .padding(.vertical, 10)
                if inputNumber != "" {
                    Text("Add Number")
                        .foregroundColor(.blue)
                }
            }
            .frame(height: 200)
            
            Spacer()
            ForEach(dialDummy, id: \.self) { items in
                HStack {
                    ForEach(items, id: \.self) { item in
                        DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet), buttonColor: item.buttonColor, inputNumber: $inputNumber )
                    }
                }
            }
            
        }
        
    }
}
```
> @Binding 개념 정리하기
> 그전에 궁금증
> - 그렇다면 항상 다른 View에 있는 @State와 연동이 되어야 하는건가
> - 해당 @State와 이름도 같아야 하는거겠지?

<br>

## 지우기 버튼
### (먼저 해보기!) 지우기 버튼 Woowon.ver 
```swift
if inputNumber != "" {
    Button {
        inputNumber.removeLast()
    } label: {
        Text("Delete")
    }
}
```
- ```Add Number```가 추가 됐던 로직대로 만들어 보았다.