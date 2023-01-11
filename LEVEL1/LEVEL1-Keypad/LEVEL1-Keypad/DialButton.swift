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
            if dialNumber.mainNumber != "Phone",
               dialNumber.mainNumber != "Delete" {
                inputNumber += dialNumber.mainNumber
            } else if dialNumber.mainNumber == "Delete" {
                inputNumber = String(inputNumber.dropLast())
            }
                
                
        } label: {
            VStack(spacing: 0) {
                // mainNumber
                if dialNumber.mainNumber == "Phone" {
                    Image(systemName: "phone.fill")
                        .resizable()
                        .aspectRatio(1, contentMode: .fill).frame(width: 30, height: 30)
                } else if dialNumber.mainNumber == "Delete",
                          inputNumber != "" {
                    Image(systemName: "delete.left.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.gray)
                } else {
                    Text(dialNumber.mainNumber)
                        .font(.system(.title))
                        .padding(.vertical, -3)
                }
                // subAlphabet
                HStack(spacing: 3 ) {
                    ForEach(dialNumber.subAlphabet, id: \.self ) { item in
                        Text(item)
                            .font(.system(size: 11))
                            .bold()
                    }
                }
            }
            .foregroundColor(.white)
            .frame(width: 65, height: 65)
            .background(buttonColor)
            .clipShape(Circle())
        }
        .padding(.all, 6)
    }
}

struct DialButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
