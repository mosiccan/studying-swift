//
//  NumberButton.swift
//  LEVEL1-(Assn)-LockScreen
//
//  Created by 강우원 on 2023/01/17.
//

import SwiftUI

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

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
