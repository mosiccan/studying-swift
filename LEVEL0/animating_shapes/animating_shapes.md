## Animating Shapes
> 애니메이션 도형

<br>

###  도형 크기 조절


###  도형 제어자


###  사용자 설정 도형 생성하기

<br>

###  도형 구성하기
``` swift
    Circle()
        .inset(by: CGFloat(arc) * 25 )
        .trim(from: 0.5, to: 1.0)
```
<br>

### 기본 애니메이션
``` swift
    RoundedRectangle(cornerRadius: 20)
        .foregroundColor(.indigo)
        .frame(maxHeight: 200)
        .scaleEffect(isScaled ? 1 : 0.5)
        .animation(.easeInOut, value: isScaled)
            // .easeInOut, .spring(), .linear(duration:) 
        .onTapGesture {
                    isScaled.toggle()
                    //#-learning-code-snippet(5b.basicAnimations)
                    withAnimation(.easeInOut) {     // 누르면 커졌다가 다시 줄어듬
                        isScaled.toggle()
                    }

        }

```
<br>

### 일치하는 기하학 효과

``` swift
@State var exchange = false
@Namespace private var shapeTransition
    
private func circle() -> some View {
    Circle()
        .fill(.red)
        .frame(width: 44, height: 44)
        .matchedGeometryEffect(id: "Circle", in: shapeTransition)        
}

private func rectangle() -> some View {
    Rectangle()
        .fill(.yellow)
        .frame(width: 200, height: 50)
        .matchedGeometryEffect(id: "Rectangle", in: shapeTransition)
}

var body: some View {
    VStack {
        if exchange {
            circle()
            rectangle()
                
        } else {
            rectangle()
            circle()
                
        }
    }
    .padding()
    .onTapGesture { // 해당 도형 터치시 exchange의 toggle값 바뀜 
        withAnimation {
            exchange.toggle()   // toggle() -> 동작에 따라 true, false값 바꿔줌
        }
    }   
}

```

<br>

### 심장 박동
```swift
// 하트 그리기
struct Heart: Shape {
/*#-code-walkthrough(1.heartPulse)*/
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY ))
       
       // 왼쪽 곡선
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.height/4),
                      control1:CGPoint(x: rect.midX, y: rect.height*3/4),
                      control2: CGPoint(x: rect.minX, y: rect.midY))
        
        // 하트 상단 호 부분
        path.addArc(center: CGPoint( x: rect.width/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        path.addArc(center: CGPoint( x: rect.width * 3/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        
        // 오른쪽 곡선
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.height),
                      control1: CGPoint(x: rect.width, y: rect.midY),
                      control2: CGPoint(x: rect.midX, y: rect.height*3/4))
       
        return path
    }
}
```

``` swift
// 하트 커지는 부분
struct PulsingHeart: View {
    /*#-code-walkthrough(6.heartPulse)*/
    @State private var heartPulse: CGFloat = 1
    var body: some View {
        Heart()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .scaleEffect(heartPulse)
            .shadow(color: .pink, radius: 10)
            .onAppear{
                withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                    heartPulse = 1.25 * heartPulse  // 숫자 크기로 최대 크기 정함
                }
            }
    }
}


```

<br>

### 회전 애니메이션
``` swift
struct SpinningEllipse: View {
    /*#-code-walkthrough(2.spinningAnimation)*/
        @State private var width: CGFloat = 200

        var body: some View {
            Ellipse()
                .frame(width: width, height: 200)
                .foregroundColor(.orange)
                .onAppear {
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(2)) {
                        width = 0   // 0~200까지 반복
                    }
                }
        }
}

```

<br>

### 폭발 애니메이션
``` swift
struct ExplodingView: View {
/*#-code-walkthrough(0.explodingAnimation)*/
    @State private var isExploded = false
    private let explodingBits: Int = 75
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0..<explodingBits, id: \.self) { _ in
                    Rectangle() // 작은 사각형들, isExploded가 true일 때 폭발
                        .rotation(Angle(degrees: Double.random(in: 0..<360)))   // 360도 방향으로 흐터짐
                        .frame(width: 20, height: 20)
                        .foregroundColor(.indigo)
                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.6), value: isExploded)
                        .padding()
                }
                Rectangle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.indigo)
                    .opacity(isExploded ? 0 : 1)
                    .animation(.easeInOut.speed(0.6), value: isExploded)
                    .padding()
            }
            Spacer()
            PlayResetButton(animating: $isExploded)
        }
        .navigationTitle("Explosion Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

```

<br>


### 굽이진 무지개
```swift
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 10) // 10줄
    @State private var colors: [Color] = [.pink, .mint, .orange, .teal, .yellow, .cyan, .purple, .blue]

    let springAnimation = Animation.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.9)
    // response : 눌렀을때 커지는 크기
    // dampingFraction : 낭창낭창 떨리는 정도...?
    // blendDuration : 
```

<br>

### 드래그 앤 드롭
```swift
    .gesture(DragGesture()
                            .onChanged({ drag in
                    offset = drag.translation
                    isAnimating = true
                }))
```

```swift
    Circle()
        .foregroundColor(colors.randomElement())
        .offset(offset)
        .scaleEffect(scaleFactor)
        .animation(springAnimation.delay(Double(index) / animationSpeed), value: offset)

//  animationSpeed 

```

<br>

### 춤추는 점
- 복잡하다... 한줄한줄 이해가 필요해보인다.
```swift
    
```