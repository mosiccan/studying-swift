# LEVEL1 클론코딩 - 키패드앱 개선해보기

## 추가해볼 수 있는 기능들
- Add Button 눌렀을 때 Create New Contact, Add tp Existing Contact가 뜬다. ✅
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

### Add Button 눌렀을 때 Create New Contact, Add tp Existing Contact가 뜬다.
- contextMenu는 아니다.
- MenU
```swift
Menu("Add Button") {
    Button {
        
    } label: {
        Text("Create New Contact")
        Image(systemName: "person.crop.circle")
    }
    Button {
        
    } label: {
        Text("Add to Existing Contact")
        Image(systemName: "person.crop.circle.fill.badge.plus")
    }
    
}
```