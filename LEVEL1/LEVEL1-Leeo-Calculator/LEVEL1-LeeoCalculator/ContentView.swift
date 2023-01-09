//
//  ContentView.swift
//  LEVEL1-LeeoCalculator
//
//  Created by 강우원 on 2023/01/07.
// test

import SwiftUI

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
        case .plus :
            return "+"
        case .minus :
            return "-"
        case .multiple :
            return "✕"
        case .divide :
            return "÷"
        case .percent :
            return "%"
        case .opposite :
            return "+/-"
        case .clear :
            return "C"
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

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    @State var tempNumber: Int = 0
    @State var operatorType: ButtonType = .clear
    @State var isNotEditing: Bool = true
    // var isWide: Bool = false    // 0 버튼 크기를 위한 변수
    
    private let buttonData: [[ButtonType]] = [
        [.clear, .opposite, .percent, .divide],
        [.seventh, .eighth, .nineth, .multiple],
        [.fourth, .fifth, .sixth, .minus],
        [.first, .second, .third, .plus],
        [.zero, .dot, .equal],
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
                        .font(.system(size: 90))
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                }
                
                ForEach(buttonData, id: \.self) { line in
                    HStack{
                        ForEach(line, id: \.self ) { item in
                            Button {
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
                                    } else if item == .divide {
                                        tempNumber = Int(totalNumber) ?? 0
                                        operatorType = .divide
                                        isNotEditing = true
                                    } else if item == .equal {
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
                                        operatorType = .equal
                                    } else if item == .zero {
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
                                    
                                }
                                
                            } label: {
                                Text(item.buttonDisplayName)
                                    .frame(width: calculateButtonWidth(button: item), height: calculateButtonHeight(button: item))
                                    .background(item.backGroundColor)
                                    .cornerRadius(40)
                                    .foregroundColor(item.foreGroundColor)
                                    .font(.system(size: 40))
                            }
                        }
                    }
                }
            }
        }
    }
    
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

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
