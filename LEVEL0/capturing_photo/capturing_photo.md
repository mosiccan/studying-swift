## Capturing Photo
> 사진 캡쳐하기

<br>

### 카메라 사용하기
```swift
final class DataModel: ObservableObject {
    let camera = Camera()
}
```

<br>

### 미리보기 스트림 살펴보기
```swift
lazy var previewStream
// CIImage 객체의 비동기 스트림
```
으로 미리보기 이미지 수신!

<br>

### 미리보기 스트림 처리하기
```swift
    init() {
        /*#-code-walkthrough(previewflow.taskHandlePreviews)*/
        Task {
            await handleCameraPreviews()
        }
        Task {
            await handleCameraPhotos()
        }
    }
```
```Datamodel```의 
```handleCameraPreviews``` 함수 사용  
비동기 시퀀스 작업 공부하기

<br>

### 미리보기 스트림 보기
```swift
     ViewfinderView(image: $model.viewfinderImage )
```
- 카메라의 라이브 영상 표시하는 ViewFinder
- 계속해서 이미지를 업데이트해서 보여주기 때문에 라이브 영상으로 인식하게되는 원리

- 버그
- value of type Camera has no member previewStream
- 다시해보기!! (2023/01/01)