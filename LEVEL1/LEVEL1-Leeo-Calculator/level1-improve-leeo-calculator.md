# LEVEL1 클론코딩 - 계산기앱 개선해보기!

- 참고한 사이트   
[Ricardo Montemayor - Build the Apple Calculator in SwiftUI](https://betterprogramming.pub/build-the-apple-calculator-in-swiftui-2fad61285dc8)

<br>

## 추가해볼 수 있는 기능들
  - 1,000 단위마다 ',' 넣어주기!
  - 숫자가 커질때 글자 크기 줄이기 ✅
  - +/- 기능 (부호 전환)
  - 나누기 ✅
    - 나누기 0 은 Error 처리
  - 연산자 우선순위!
  - C, AC 변환
  - 연산 기호 누를 때 배경이 하얗게 변함(속도있음)
  - 0을 계속 눌러도 추가되지 않고 0 하나만 있다! ✅
  - '=' 을 연속으로 누르면 이전 연산자 값으로 계속 연산을 한다. ✅

## 로직 풀체인지
- 구조 변경 

<br>

### 1,000 단위마다 ',' 넣어주기



<br>

### 숫자가 커질때 글자 크기 줄이기
```swift
Text(totalNumber)
    .padding()
    .font(.system(size: 90))
    .foregroundColor(.white)
    .fontWeight(.light)
    // 추가해주기 ↓
    .lineLimit(1)
    .minimumScaleFactor(0.2)
```

<br>

### +/- 기능 (부호 전환)


<br>

### 나누기
```swift
else if operatorType == .divide {
    // 0으로 나눴을 때 Error를 띄워준다.
    if totalNumber == "0" {
        totalNumber = "Error"
    } else {
        totalNumber = String(tempNumber / (Int(totalNumber) ?? 0))
    }
}
```

<br>

### 0을 계속 눌러도 추가되지 않고 0 하나만 있다!
```swift
else if item == .zero {
    if totalNumber == "0" {
        totalNumber = "0"
    } else {
        totalNumber += item.buttonDisplayName
    }
} else {    // 0 이외의 숫자를 누를 때
    if totalNumber == "0" {
        totalNumber = item.buttonDisplayName
    }
    else {
        totalNumber += item.buttonDisplayName
    }
}
```

<br>

### '=' 을 연속으로 누르면 이전 연산자 값으로 계속 연산을 한다.
```swift
else if item == .equal {
    if operatorType == .plus{
        totalNumber = String((Int(totalNumber) ?? 0) + tempNumber)
    } else if operatorType == .multiple {
        totalNumber = String((Int(totalNumber) ?? 0) * tempNumber)
    } else if operatorType == .minus {
        totalNumber = String(tempNumber - (Int(totalNumber) ?? 0))
    } else if operatorType == .divide {
        if totalNumber == "0" {
            totalNumber = "Error"
        } else {
            totalNumber = String(tempNumber / (Int(totalNumber) ?? 0))
        }
    }
    // 추가
    operatorType = .equal
}
```