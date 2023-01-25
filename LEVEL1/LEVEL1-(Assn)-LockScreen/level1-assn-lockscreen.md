# LEVEL1 과제 - LockScreen


## 구현해볼 기능들
- 비밀번호를 잘 입력했을 때 Lock 이모지가 풀리면서 애니메이션! ✅
- 숫자 버튼이 눌리면 Cancel 버튼이 Delete로 변한다.✅
- 버튼을 누를 때 버튼 영역이 흰 배경으로 됐다가 돌아와야하는데 현재는 material 효과가 어둡게 됐다가 돌아온다.
- 숫자 버튼을 누를 때 circle들이 circle.fill 로 변한다. ✅
  - delete를 누르면 하나씩 다시 circle로 돌아오기 ✅
- 암호 틀렸을 때 circle로 돌아오기, circle들이 흔들리기 ✅

<br>

## 특정 버튼만 Material 효과를 주는 방법
```swift
struct NumberButton: View {
    
    let number: Number
    let buttonMaterial: Material?
    
    var body: some View {
        Button {
            
        } label: {
            if let material = buttonMaterial {
                
                VStack(spacing: 0){
                    if number.mainNumber == "0" {
                        Text(number.mainNumber)
                            .font(.system(.largeTitle))
                    } else {
                        Text(number.mainNumber)
                            .font(.system(.largeTitle))
                        HStack(spacing: 3) {
                            ForEach(number.subAlphabet, id: \.self) { item in
                                Text(item)
                                    .font(.system(size: 11))
                                    .bold()
                            }
                        }
                    }
                    
                }
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(material)
                .clipShape(Circle())
            } else {
                VStack(spacing: 0){
                    Text(number.mainNumber)
                        .font(.system(.largeTitle))
                    HStack(spacing: 3) {
                        ForEach(number.subAlphabet, id: \.self) { item in
                            Text(item)
                                .font(.system(size: 11))
                                .bold()
                        }
                    }
                }
            }
            
        }
    }
    
}
```

<br>

## 새로 알게된 개념

### Material
- Number 버튼에 일반적인 버튼이 아니라 Material에 해당하는 값들을 넣어주자.

### Tab bar
- iOS 혹은 모바일에서 검색, 홈 같은 메뉴들이 있는 아래 부분을 ```Tab bar```라고 한다.


## 숫자 버튼을 누를 때 circle들이 circle.fill 로 변한다
- 처음에 접근한 방식
- > 배열의 원소에 값이 있다면 ```"circle.fill"``` 출력 없다면 ```"circle"``` 출력을 하고자 했다.
```swift
ForEach(0..<6) { number in
    if inputNumber.contains(number) {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 13, height: 13)
    } else {
        Image(systemName: "circle")
            .resizable()
            .frame(width: 13, height: 13)
    }
    
}
// 혹은
if inputNumber[number]
// 같은 방식으로 접근했지만 실패
```

- 해결
```swift
ForEach(0..<6) { number in
    if inputNumber.count > number {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 13, height: 13)
    } else {
        Image(systemName: "circle")
            .resizable()
            .frame(width: 13, height: 13)
    }
}
```
- 조금 더 효율적으로 생각을 해서
- count값이 반복문의 number값 (0~6) 보다 클 때 ```"circle.fill"```을 출력해주면 된다.
- 버튼을 1번 눌렀을 때
  - count는 1이고 number값은 0이므로 ```"circle.fill"``` 출력
- 비슷한 원리로 Cancel 버튼과 Delete 버튼 변환을 해주면 될 것 같다.

<br>

### delete를 누르면 하나씩 다시 circle로 돌아오기

```swift
Button(action: {
    // delete action
    if inputNumber.count > 0 {
        isDeleteMode = true
      }
    if isDeleteMode == true {
        inputNumber = String(inputNumber.dropLast())
    }
}) {
    if inputNumber.count == 0 {
        Text("Cancel")
            .font(.system(.body))
    } else if inputNumber.count > 0 {
        Text("Delete")
            .font(.system(.body))
    }
}
```
- ```inputNumber.count == 0```일 때 Cancel을 표시해주며
- 0 이상일 때는 Delete를 보여준다.
- Bool 타입 isDeleteMode 변수를 만들어서 Delete 상태임을 체크 후 true이면서 버튼이 눌렸을 때 ```dropLast()```로 하나씩 지워준다.

<br>

## 비밀번호를 잘 입력했을 때 Lock 이모지가 풀리면서 애니메이션!
[발견한 페이지](https://iosexample.com/iphone-faceid-unlock-animation/)

<br>

## 암호 틀렸을 때 circle로 돌아오기, circle들이 흔들리기
- 6번 눌렀을 때 inputNumber가 초기화 되야하는데 어느 부분에서 초기화 해야할까

### 먼저 떨림 구현하고 다른 버튼에 적용해보기
```swift
 @State var numberOfShakes: CGFloat = 0

/// 버튼 부분
Text("Emergency")
    .font(.system(.body))
    .modifier(ShakeEffect(shakeNumber: numberOfShakes))
    .onAppear {
        withAnimation(.easeIn(duration: 0.5)) { // 0.5초 동안
            numberOfShakes = 3  // 떨림 횟수 정해주기
        }
    }

/// 애니메이션 부분
struct ShakeEffect: AnimatableModifier {
    var shakeNumber: CGFloat = 0

    var animatableData: CGFloat {
        get {
            shakeNumber
        } set {
            shakeNumber = newValue
        }
    }

    func body(content: Content) -> some View {
        content
            .offset(x: sin(shakeNumber * .pi * 2) * 5)  // 떨림 범위..?
    }
}
```
> .offset부분 정확히 어떤 원리로 값이 매겨지는지 모르겠다.
- 이제 위 코드를 circle들에 적용하면되는데,,,

### 버튼에 적용해보기도 성공
```swift
Button(action: {
    // emergency action
    withAnimation(.easeIn(duration: 0.5)) {
        numberOfShakes = 3
    }
    numberOfShakes = 0  // 반드시 초기화 해줘야 계속해서 할 수 있다.
}) {
    Text("Emergency")
        .font(.system(.body))
        .modifier(ShakeEffect(shakeNumber: numberOfShakes))
        
    
}

```

- 우선 비밀번호에 대한 보안성은 완전히 깨졌다.
- 도대체 어떤 방법을 이용해야할까!!!

<br>

### 하드코딩으로 일단 구현은 완료...!
```swift
HStack {
    if inputNumber.count == 6 && isCorrectPassword == false {
        HStack(spacing: 24) {
            ForEach(0..<6) { number in
                if inputNumber.count > number {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .modifier(ShakeEffect(shakeNumber: numberOfShakes))
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.5)) {
                                numberOfShakes = 3
                            }
                            numberOfShakes = 0
                        }
                } else {
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .modifier(ShakeEffect(shakeNumber: numberOfShakes))
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.5)) {
                                numberOfShakes = 3
                            }
                            numberOfShakes = 0
                        }
                    
                }
            }
        }
    } else {
        HStack(spacing: 24) {
            ForEach(0..<6) { number in
                if inputNumber.count > number {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 13, height: 13)
                } else {
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 13, height: 13)
                    
                }
            }
        }
    }
}
.foregroundColor(.white)
```
- HStack 안에 if 문으로 6글자 입력 완료 여부, 올바른 비밀번호인지 여부 확인 후 이미지에 modifier과 .onAppear로 애니메이션을 적용해줬다. 아닐 경우는 그대로 출력되게 해줬다.