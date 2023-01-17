//
//  DialButton.swift
//  LEVEL1-Keypad
//
//  Created by 강우원 on 2023/01/10.
//

import SwiftUI

struct DialButton: View {
    
    let dialNumber: Dial
    let buttonColor: Color?
    @Binding var inputNumber: String
    
    var body: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                // mainNumber
                if dialNumber.mainNumber == "Phone" {
                    Image(systemName: "phone.fill")
                        .resizable()
                        .imageScale(.large)
                        .frame(width: 30, height: 30)
    
                }  else if dialNumber.mainNumber == "Delete" {
                    Image(systemName: "delete.left.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.gray)
                    
                } else if dialNumber.mainNumber == "#" {
                    Text(dialNumber.mainNumber)
                        .scaledToFit()
                        .font(.system(size: 36, weight: .bold, design: .serif))
                } else {
                    if dialNumber.mainNumber == "*" {
                        Spacer()
                        Spacer()
                        Spacer()
                        Text(dialNumber.mainNumber)
                            .scaledToFit()
                            .font(.system(size: 64))
                    } else {
                        Text(dialNumber.mainNumber) // 여기서 숫자 입력이 들어감
                            .font(.system(.largeTitle))
                            .padding(.vertical, -3)
                    }
                }
                // subAlphabet
                HStack(spacing: 3 ) {
                    ForEach(dialNumber.subAlphabet, id: \.self ) { item in
                        if ((dialNumber.mainNumber == "*" || dialNumber.mainNumber == "Phone" || dialNumber.mainNumber == "#" || dialNumber.mainNumber == "Delete" ) && item.isEmpty) {}
                        else {
                            Text(item)
                                .font(.system(size: 11))
                                .bold()
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .frame(width: 80, height: 80)
            .background(buttonColor)
            .clipShape(Circle())
        }
        .highPriorityGesture(TapGesture()
            .onEnded({ _ in // 짧게 누를때 gesture
                if dialNumber.mainNumber != "Phone",
                   dialNumber.mainNumber != "Delete" {
                    inputNumber += dialNumber.mainNumber
                } else if dialNumber.mainNumber == "Delete" {
                    inputNumber = String(inputNumber.dropLast())
                }
            }))
        .simultaneousGesture(LongPressGesture()
            .onEnded { _ in // 길게 누를때 gesture
                if dialNumber.mainNumber == "0" {
                    self.inputNumber += "+"
                } else if dialNumber.mainNumber != "Phone",
                          dialNumber.mainNumber != "Delete" {
                    inputNumber += dialNumber.mainNumber
                }
            })
        
        .padding(.all, 6)
    }
}

struct DialButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
