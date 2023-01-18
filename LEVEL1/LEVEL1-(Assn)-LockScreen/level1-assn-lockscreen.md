# LEVEL1 과제 - LockScreen


## 구현해볼 기능들
- 비밀번호를 잘 입력했을 때 Lock 이모지가 풀리면서 애니메이션!
- 숫자 버튼이 눌리면 Cancel 버튼이 Delete로 변한다.
- 버튼을 누를 때 버튼 영역이 흰 배경으로 됐다가 돌아와야하는데 현재는 material 효과가 어둡게 됐다가 돌아온다.
- 숫자 버튼을 누를 때 circle들이 circle.fill 로 변한다.
  - delete를 누르면 하나씩 다시 circle로 돌아오기

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
