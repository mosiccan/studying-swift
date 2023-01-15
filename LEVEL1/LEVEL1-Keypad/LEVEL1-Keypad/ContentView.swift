//
//  ContentView.swift
//  LEVEL1-Keypad
//
//  Created by 강우원 on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputNumber: String = ""
    let koreaPhoneNumberPattern = "^01[0-1, 7][0-9]{7,8}$"
    
    
    fileprivate func numberLabelView() -> some View {
        return VStack {
            Text(inputNumber)   // 사용자가 입력한 숫자를 화면에 뿌려줌
                .font(.system(size: 32))
                .padding(.vertical, 10)
            if !inputNumber.isEmpty {
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
    
    var body: some View {
        VStack {
            Spacer()
            numberLabelView()
            Spacer()
            keypadDialView()
            Spacer()
        }
        
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
