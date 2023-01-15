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
- Menu
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

<br>

### numberLabelView에 규칙을 넣어본다.
- 생각보다 종류가 너무 많다. 정규식을 써야하는걸까...
- 미국의 경우 +1을 하고 425 555 5555면
  - +1 (425) 555-5555로 된다. 
- "-" 넣는 부분
  - > (0, *, #이 아닌 상태에서)
  - '1'만 누르고
    - 4자리 xx-xx
    - 5자리 xx-xxx
    - 6자리 xx-xxx-x
    - 7자리 xx-xxx-xx
    - 8자리 xx-xxx-xxx
    - 9자리 xx-xxx-xxxx
    - 10자리 xx-xxxx-xxxx
    - 11자리 xxxxxxxxxxx
  - 10
    - 10-00
    - 10-000
    - 10-000-0
    - 10-000-00
    - 10-000-000
    - 10-000-0000
    - 10-0000-0000
    - 10000000000  
<br>
- 생각보다 많아져서 먼저
- 010-0000-0000 형태를 구현해보자
  - 01 로 시작
  - 011
  - 011-1
  - 011-11
  - 011-111
  - 011-111-1
  - 011-111-11
  - 011-111-111
  - 011-111-1111
  - 011-1111-1111
  - 012345678910
  - 3자리 쌓고, -
  - 3자리 쌓고, -
  - 4자리 쌓고
  - 3자리 4자리 4자리

정규식
```swift    
    let regex = "^01[0-1, 7][0-9]{7,8}$"
```
- 01로 시작
- 01 다음에는 0,1,7 가능
- 그 다음에 오는 숫자는 0~9 가능하고 7자리에서 8자리만 가능  
<br>
로직
  - 숫자 입력때 마다 정규식을 확인한다. 정규식 충족하면 실행
  - 3자리 이후 - 추가
  - 다음 3자리까지 숫자 입력
  - 그 후 - 추가
  - 다음 4자리까지 숫자 입력
  - 그 후 3-4-4 형태로 만듬(먼저 입력 된게 2번째 숫자모음 뒤에 붙음)
  - 초과시 12자리 - 없이 출력
<br>
현재 고민
- View에서 '-'를 넣어주는 조건을 걸어줘야하나
- DialButton에서 '-'넣어주는 조건을 걸어줘야하나 모르겠다.

```swift
// 출처 : https://me.innori.com/2679
extension String {
    func pretty() -> String {
        let _str = self.replacingOccurrences(of: "-", with: "") // 하이픈 모두 빼준다
        let arr = Array(_str)
        
        if arr.count > 3 {
            let prefix = String(format: "%@%@", String(arr[0]), String(arr[1]))
            if prefix == "02" { // 서울지역은 02번호
                if let regex = try? NSRegularExpression(pattern: "([0-9]{2})([0-9]{3,4})([0-9]{4})", options: .caseInsensitive) {
                    let modString = regex.stringByReplacingMatches(in: _str, options: [],
                            range: NSRange(_str.startIndex..., in: _str),
                            withTemplate: "$1-$2-$3")
                    return modString
                }
                
            } else if prefix == "15" || prefix == "16" || prefix == "18" {
                if let regex = try? NSRegularExpression(pattern: "([0-9]{4})([0-9]{4})", options: .caseInsensitive) {
                    let modString = regex.stringByReplacingMatches(in: _str, options: [],
                            range: NSRange(_str.startIndex..., in: _str),
                            withTemplate: "$1-$2")
                    return modString
                }
            } else { // 나머지는 휴대폰번호 (010-xxxx-xxxx, 031-xxx-xxxx, 061-xxxx-xxxx 식이라 상관무)
                if let regex = try? NSRegularExpression(pattern: "([0-9]{3})([0-9]{3,4})([0-9]{4})", options: .caseInsensitive) {
                    let modString = regex.stringByReplacingMatches(in: _str, options: [],
                            range: NSRange(_str.startIndex..., in: _str),
                            withTemplate: "$1-$2-$3")
                    return modString
                }
            }
        }
        
        return self
    }
}
```
- 이 경우 0101 입력 시 010-1이 아닌 0101이 입력되며
- 10자리수 부터 010-111-1111으로 표기된다.
- 010의 경우 4자리부터는 -를 붙이게끔 수정해보자