## Recognizing Gestures
> 재스처 인식 기능

<br>

### 탭 제스처 설정하기
```swift
    .gesture(tapGesture)
```
- ```.gesture``` 제어자를 사용하여 제스처를 추가할 수 있음
- 위 예시에서 사용자가 만든 ```tapGesture``` 를 사용함    

<br>

```swift
    var tapGesture: some Gesture {
        /*#-code-walkthrough(1.gestureDefinition)*/
        TapGesture()
            .onEnded {  // Adds an action to perform when the gesture ends.
                withAnimation { // 색상 변경!
                    color = Color.random()
                }
            }
    }
```
>탭 제스처 구현
- ```.onEnded``` : 제스처가 끝날 때 수행할 작업을 추가 


<br>

### 직사각형 확대 또는 축소하기
```swift
// isScaled 상태 속성 추가해주기
 @State private var isScaled = false    

    Rectangle()
        .gesture(tapGesture)
        .scaleEffect(isScaled ? 2 : 0.25)

// TapGesture 내
    .onEnded {
                withAnimation {
                    color = Color.random()
                    isScaled.toggle()
                }
            }
```

<br>

### 길게 누르기 제스처 설정하기
```swift
@State private var sizeIndex = 0

private var sizes: [CGSize] = [
        CGSize(width: 150, height: 80),
        CGSize(width: 200, height: 40),
        CGSize(width: 50, height: 250),
        CGSize(width: 220, height: 100),
        CGSize(width: 90, height: 90),
    ]

struct LongPressView: View {
}
```
- ```LongPressView``` 에서는 모양을 길게 터치하면 캡슐의 모양과 너비를 변경함
- 캡슐크기를 변경하려면 크기 값의 배열을 반복해야함.
- 상태 속성 ```sizeIndex``` 를 설정하여 업데이트 하도록 만들기!


```swift
LongPressGesture(minimumDuration: 1.0)
```
- 최소 누르기 실행 시간 지정 가능

<br>

### 제스처가 시작될 때 시각적인 효과 생성하기
```swift
@GestureState var isDetectingLongPress = false


LongPressGesture(minimumDuration: 0.5)
        /*#-code-walkthrough(2.onEndedEvent)*/
            .onEnded { value in
                withAnimation {
                    sizeIndex += 1
                    if sizeIndex == sizes.count {
                        sizeIndex = 0
                    }
                }
            }   // 추가
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                gestureState = currentState
            }


            Capsule()
                .foregroundColor(.yellow)
            /*#-code-walkthrough(2.frame)*/
                .frame(width: sizes[sizeIndex].width, height: sizes[sizeIndex].height)
                .gesture(longPressGesture)
                .shadow(radius: isDetectingLongPress ? 20 : 0)  // 추가
```
- ```onChanged()``` : 제스처의 값이 변경될 때 업데이트를 수신
- ```updating()``` : 제스처의 값이 변경될 때 **상태 속성**을 업데이트

<br>

### 회전 
```swift
@State private var rotation = Angle.zero


var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged{ angle in
                rotation = angle
            }
            .onEnded { angle in // 마지막 angle값을 얻어내기 위해 사용
                rotation = angle
            }
    }


Rectangle()
        .rotationEffect(rotation)
```
- 두 손가락 회전 제스처를 사용하여 사각형을 회전시키기


<br>

### 재스처 값 사용하기
```swift
Text("\(rotation.degrees)")
    .font(.system(.body, design: .monospaced))
```
- 각도 확인해보기
- ```LongPressGesture``` 에서는 버튼을 누르고 있는 시간 등을 체크해볼 수 있을 것 같다.

<br>

### 드래그 제스처 설정하기
```swift
    @State private var offset = CGSize.zero // 위치 추적, 시작점으로부터 원의 오프셋을 나타내는 거리 벡터값으로 사용됨


    var dragGesture: some Gesture {
        DragGesture()
        /*#-code-walkthrough(3.onChanged)*/
            .onChanged { value in   // 드래그 위치 변경될 때마다 호출
                offset = CGSize(width: value.startLocation.x + value.translation.width - circleSize/2,
                                height: value.startLocation.y + value.translation.height - circleSize/2)
            }
    }

Circle()
        .foregroundColor(.teal)
        .frame(width: circleSize, height: circleSize)        
        .offset(offset)
        .gesture(dragGesture)
```
- 오브젝트 잡고 이동시키기!

- value.translation.height **- 50** - circleSize/2
- - value.translation.widtf **- 50** - circleSize/2
  - 각각 50을 빼주면 드래그시 원의 -50, -50 위치에서 드래그가 된다.
  - (처음 잡을 땐 원을 잡고)
- height 값을 0으로 바꾸면 가로가 고정된 상태로 좌우로만 이동하게 된다.

<br>

### 배치 애니메이션 생성하기
```swift
@State private var scale = 1.0  // 원의 크기 조절 상태 추적


DragGesture()
    .onChanged { value in
        offset = CGSize(width: value.startLocation.x + value.translation.width -  circleSize/2,
                        height: value.startLocation.y + value.translation.height -  circleSize/2)
        withAnimation {     // withAnimation 추가
            scale = 1.5
        }
    }
    .onEnded { value in // 제스처 끝났을 때 원래대로 돌려놓기
        withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) { 
            scale = 1
        }
    }

// Circle의 frame 값에 scale 반영하기
.frame(width: circleSize * scale, height: circleSize * scale)

```

<br>

### 선 그리기
```swift
//  선의 시작점과 끝점을 추적하는 각각의 상태 속성 추가
    @State var lineStart = CGPoint.zero 
    @State var lineEnd = CGPoint.zero

    ZStack {
        Path { path in  // 모양과 윤곽을 생성
            path.move(to: lineStart)
            path.addLine(to: lineEnd)
        }
        .stroke(Color.accentColor, lineWidth: 8.0)
        .contentShape(Rectangle())
    }
    .gesture(lineDrawingGesture)


    DragGesture()
            /*#-code-walkthrough(6.onChanged)*/
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
                // lineStart는 초기 위치 이용하며 일정하게 유지됨
                // lineEnd는 .onChanged 이벤트가 전송될 때 마다 새 위치로 업데이트!
            }
            .onEnded { value in
                lineEnd = value.location
                //  마지막 위치 캡쳐, 새 드래그 시작할 때까지 선은 그대로 유지
            }
```

<br>

### 여러 개 선 표시하기
```swift
// Path값 저장, 계속해서 선 추가하면 사용자가 그린 모든 선으로 그림을 업데이트
@State private var drawing = Path()

// 드래그 제스처 시작할 때 마다, 해당 제스처의 시작 위치로 이동해야함
DragGesture()
    .onChanged { value in
        lineStart = value.startLocation
        lineEnd = value.location
        drawing.move(to: value.startLocation)
    }
    // 드래그 끝나면 마지막 위치 기반으로 Path에 선 추가
    .onEnded { value in
        lineEnd = value.location
        drawing.addLine(to: value.location)
    }


ZStack {
    drawing
        .stroke(Color.accentColor, lineWidth: 8.0)
        .contentShape(Rectangle())
}

```

<br>

### 제스처 구성하기
```swift
 var sequenceGesture : some Gesture {
        SequenceGesture(singleTapGesture, doubleTapGesture)
            .onEnded { _ in
                withAnimation {
                    isClosed.toggle()
                }
            }
    }
```
- ```sequenceGesture``` : 하나가 끝난 뒤 다른 하나가 실행되어야 하는 제스처를 결합함. 두 가지 모두 순차적으로 수행된 다음 ```onEnded``` 이벤트 핸들러가 트리거가됨.
- ```simultaneousGesture``` : 두 제스처 중 어느걸 사용해도 동시에 인식
- ```exclusiveGesture``` : 두 개 제스처 중 하나만 성공하도록함, 첫번째 제스처를 선호하도록 값을 넣어주자