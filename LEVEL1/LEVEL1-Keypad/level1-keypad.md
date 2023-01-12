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

<br>

## 길게 누르기
- 한가지의 버튼에 2가지의 제스처가 들어간다!
```swift
// DialButton

.simultaneousGesture(LongPressGesture()
            .onEnded { _ in // 길게 누를때 gesture
                if dialNumber.mainNumber == "0" {
                    self.inputNumber += "+"
                } else if dialNumber.mainNumber != "Phone",
                          dialNumber.mainNumber != "Delete" {
                    inputNumber += dialNumber.mainNumber
                }
            })
.simultaneousGesture(TapGesture()
            .onEnded({ _ in // 짧게 누를때 gesture
                if dialNumber.mainNumber != "Phone",
                   dialNumber.mainNumber != "Delete" {
                    inputNumber += dialNumber.mainNumber
                } else if dialNumber.mainNumber == "Delete" {
                    inputNumber = String(inputNumber.dropLast())
                }
            }))
        .padding(.all, 6)
```
- 여기까지 우선 기능 구현 먼저!


<br>

## 앱 돌아보기
### ContentView 함수화
```swift
VStack {
            Spacer()
            numberLabelView()
            Spacer()
            keypadDialView()
            Spacer()
}

fileprivate func numberLabelView() -> some View {
    return VStack {
        Text(inputNumber)
            .font(.system(size: 32))
            .padding(.vertical, 10)
        if !inputNumber.isEmpty {
            Text("Add Number")
                .foregroundColor(.blue)
        }
    }
    .frame(height: 200)
}

fileprivate func keypadDialView() -> ForEach<[[Dial]], [Dial], HStack<ForEach<[Dial], Dial, DialButton>>> {
    return ForEach(dialDummy, id: \.self) { items in
        HStack {
            ForEach(items, id: \.self) { item in
                DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet), buttonColor: item.buttonColor, inputNumber: $inputNumber )
            }
        }
    }
}
```
- 함수화 할 수 있는 영역을 드래그 후 "우클릭-Refactor-Extract to Method"를 거쳐 함수화가 가능하다.

### 추가해볼 수 있는 기능들
- Add Button 눌렀을 때 Create New Contact, Add tp Existing Contact가 뜬다.
- numberLabelView에 규칙을 넣어본다.
  - > ex) 번호 입력시 '-'를 추가한다. 특정 수 이상 넘어가면 '-'가 사라진다 등등
- numberLabelView를 누르면 copy/paste 버튼이 뜬다.
  - 입력된 값이 없을 때 누르면 paste 버튼만 뜬다.
- 전화 버튼 이미지 배치 정중앙에 하기
- Add Number, 지우기 버튼 fade in, out 애니메이션
- 지우기 버튼을 꾹 누르고 있으면 하나씩 빠르게 지워진다. (현재는 지워지지 않음)
- 0을 누를때 현재는 꾹 누르면 바로 +가 입력되지만 실제 앱에선 0에서 +로 바뀐다.
- 등등

<br>

## 키패드앱 - 과제
- 잠금화면 구현하기
### 구현 포인트 (리이오님의 요구사항)
- 버튼 background가 blur 처리로 뒤에 있는 배경에 따라 blur 효과가 적용된다.
- 0만 정중앙
- 번호를 입력할 때 위에 있는 빈 원이 찬다. 
- 비밀번호 전부 입력 후 값이 틀리면 
  - 원들이 흔들림
  - 다시 빈 원으로 돌아옴(초기화)
- 번호 입력 삭제기능, 채워진 원이 하나씩 비워짐
- 비밀번호 통과시 압호입력 화면 사라짐, 자물쇠가 열리는 애니메이션
### 구현 순서
- 화면 그리기
- 기능 구현
  - 암호의 판별