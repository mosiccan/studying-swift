# LEVEL1 클론코딩 - 계산기앱

## 화면그리기
```swift
HStack {
    Button {
         
    } label: {
        Text("7")
            .frame(width: 80, height: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 33))

    Text("8")
        .frame(width: 80, height: 80)
        .background(.gray)
        .cornerRadius(40)
        .foregroundColor(.white)
        .font(.system(size: 33))
    Text("9")
        .frame(width: 80, height: 80)
        .background(.gray)
        .cornerRadius(40)
        .foregroundColor(.white)
        .font(.system(size: 33))
    Text("✕")
        .frame(width: 80, height: 80)
        .background(.orange)
        .cornerRadius(40)
        .foregroundColor(.white)
        .font(.system(size: 33))
}

```

<br>

## 버튼 동작하게 하기

### 색깔 만들어주기
```Assets``` → ```+``` → ```Color Set```

### 버튼 눌렀을 때 추가!
```swift
 Button {
    if totalNumber == "0" {
         totalNumber = "7"
    } else {
        totalNumber += "7"
    }
     
} label: {
    Text("7")
        .frame(width: 80, height: 80)
        .background(Color("NumberButton"))
        .cornerRadius(40)
        .foregroundColor(.white)
        .font(.system(size: 33))
}

```

<br>

## 반복문을 활용해보기

```swift

private let buttonData: [[String]] = [
    ["C", "/", "%", "÷"],
    ["7", "8", "9", "✕"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["0", "0", ".", "="],
]

var body: some View {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            Spacer()

            HStack {
                Spacer()
                Text(totalNumber)
                    .padding()
                    .font(.system(size: 74))
                    .foregroundColor(.white)
            }

            ForEach(buttonData, id: \.self) { line in
                HStack{
                    ForEach(line, id: \.self ) { item in
                        Button {
                            if totalNumber == "0" {
                                totalNumber = "7"
                            } else {
                                totalNumber += "7"
                            }

                        } label: {
                            Text(item)
                                .frame(width: 80, height: 80)
                                .background(Color("NumberButton"))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .font(.system(size: 33))
                        }
                    }
                }
            }
        }
    }
}
```
- 2차원 배열에 버튼의 기호들을 넣어놓고
- 반복문을 통해 해당 라인을 불러오고, 해당 기호를 불러와 추가해준다.

<br>

## enum 활용하기

- enum 부분
```swift
enum ButtonType: String  {
    case first, second, third, fourth, fifth, sixth, seventh, eighth, nineth, zero
    case dot, equal, plus, minus, multiple, divide
    case percent, opposite, clear
    
    var buttonDisplayName: String {
        switch self {
        case .first :
            return "1"
        case .second :
            return "2"
        case .third :
            return "3"
        case .fourth :
            return "4"
        case .fifth :
            return "5"
        case .sixth :
            return "6"
        case .seventh :
            return "7"
        case .eighth :
            return "8"
        case .nineth :
            return "9"
        case .zero :
            return "0"
        case .dot :
            return "."
        case .equal :
            return "="
        case .minus :
            return "-"
        case .multiple :
            return "✕"
        case .divide :
            return "÷"
        case .percent :
            return "%"
        case .opposite :
            return "/"
        case .clear :
            return "C"
            
        default :
            return "?"
        }
    }
    
    var backGroundColor: Color {
        switch self {
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .nineth, .zero, .dot:
            return Color("NumberButton")
        case .equal, .plus, .minus, .multiple, .divide:
            return Color(.orange)
        case .percent, .opposite, .clear:
            return Color(.gray)
        }
    }
    
    var foreGroundColor: Color {
        switch self {
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .nineth, .zero, .dot, .equal, .plus, .minus, .multiple, .divide:
            return Color(.white)
        case .percent, .opposite, .clear:
            return Color(.black)
        }
    }
}
```

<br>

- 구현 부분

```swift
    ForEach(buttonData, id: \.self) { line in
        HStack{
            ForEach(line, id: \.self ) { item in
                Button {
                    if totalNumber == "0" {
                        totalNumber = "7"
                    } else {
                        totalNumber += "7"
                    }
                    
                } label: {
                    Text(item.buttonDisplayName)
                        .frame(width: 80, height: 80)
                        .background(item.backGroundColor)
                        .cornerRadius(40)
                        .foregroundColor(item.foreGroundColor)
                        .font(.system(size: 33))
                }
            }
        }
    }
```

<br>

## 숫자버튼 동작하게 하기

```swift
ForEach(buttonData, id: \.self) { line in
    HStack{
        ForEach(line, id: \.self ) { item in
            Button {
                if totalNumber == "0" { // 아무것도 눌러지지 않은 상태에서
                    if item == .clear {
                        totalNumber = "0"
                    } else if item == .plus || item == .minus || item == .multiple || item == .divide {
                        totalNumber = "Error"
                    } else {
                        totalNumber = item.buttonDisplayName
                    }
                    
                } else {
                    if item == .clear {
                        totalNumber = "0"
                    } else {
                        totalNumber += item.buttonDisplayName
                    }
                }
                
            } label: {
                Text(item.buttonDisplayName)
                    .frame(width: item == .some(.zero) ? 180 : 80, height: 80)  // 삼항 연산자
                    .background(item.backGroundColor)
                    .cornerRadius(40)
                    .foregroundColor(item.foreGroundColor)
                    .font(.system(size: 33))
            }
        }
    }
}
```
- 삼항 연산자를 통해 0 버튼 크기 늘리기
- 아무것도 눌려있지 않을 때, 연산 기호 눌렀을 때 Error 띄우기

<br>

## 사칙연산 구현하기
- 먼저 기능 구현 후 깔끔하게 짜는 순서로 해보자!
```swift
if item == .clear {
    totalNumber = "0"
} else if item == .plus {
    tempNumber = Int(totalNumber) ?? 0  // 숫자가 아니라면 0을 저장
    operatorType = .plus
    totalNumber = "0"
} else if item == .equal {
    totalNumber = String((Int(totalNumber) ?? 0) + tempNumber)
}
else {
    totalNumber += item.buttonDisplayName
}
                                    
```
- 숫자를 저장한다
- 더하기를 한다
- 남은 숫자를 초기화 한다.
- = 눌렀을때 totalNumber 출력!

## 작고 소중한 나의 계산기
```swift
    private func calculateButtonWidth(button buttonType: ButtonType) -> CGFloat {
        // (전체너비 - 5*10) / 4
        switch buttonType {
        case .zero:
            return (UIScreen.main.bounds.width - 5*10) / 4 * 2
        default:
            return ((UIScreen.main.bounds.width - 5*10) / 4)
        }
    }
    
    private func calculateButtonHeight(button: ButtonType) -> CGFloat {
            return (UIScreen.main.bounds.width - 5*10) / 4
    }



     Text(item.buttonDisplayName)
        .frame(width: calculateButtonWidth(button: item), height: calculateButtonHeight(button: item))
        .background(item.backGroundColor)
        .cornerRadius(40)
        .foregroundColor(item.foreGroundColor)
        .font(.system(size: 33))
```
- 추가해볼 수 있는 기능들
  - 1,000 단위마다 ',' 넣어주기!
  - +/- 기능 (부호 전환)
  - 나누기
  - 연산자 우선순위!
  - 기능 확장될 때 추가 용이하게 구조 바꾸기
    - 함수(첫번째 숫자, 연산자, 두번째 숫자)
  - C, AC 변환
  - 연산 기호 누를 때 배경이 하얗게 변함(속도있음)
  - 0을 계속 눌러도 추가되지 않고 0 하나만 있다!

<br>

## 입력 상태값을 넣어보기
```swift
@State var isNotEditing: Bool = true

// 버튼 부분 로직
if isNotEditing { // 아무것도 눌러지지 않은 상태에서
    if item == .clear {
        totalNumber = "0"
        isNotEditing = true
    } else if item == .plus ||
                item == .minus ||
                item == .multiple ||
                item == .divide {
        totalNumber = "Error"
    } else {
        totalNumber = item.buttonDisplayName
        isNotEditing = false    // 이미 입력 받고 있는 상태
    }
    isNotEditing = false
    
} else {
    if item == .clear {
        totalNumber = "0"
        isNotEditing = true
    } else if item == .plus {
        tempNumber = Int(totalNumber) ?? 0
        operatorType = .plus
        isNotEditing = true     // 새로 입력 받자!
    } else if item == .multiple {
        tempNumber = Int(totalNumber) ?? 0
        operatorType = .multiple
        isNotEditing = true
    } else if item == .minus {
        tempNumber = Int(totalNumber) ?? 0
        operatorType = .minus
        isNotEditing = true
    } else if item == .equal {
        if operatorType == .plus{
            totalNumber = String((Int(totalNumber) ?? 0) + tempNumber)
        } else if operatorType == .multiple {
            totalNumber = String((Int(totalNumber) ?? 0) * tempNumber)
        } else if operatorType == .minus {
            totalNumber = String(tempNumber - (Int(totalNumber) ?? 0))
        }
        
    }
    else {
        totalNumber += item.buttonDisplayName
    }
    
}

```

- 로직 정말 리팩토링이 필요해보인다...!!!