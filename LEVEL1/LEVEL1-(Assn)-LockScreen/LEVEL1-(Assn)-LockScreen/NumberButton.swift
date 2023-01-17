//
//  NumberButton.swift
//  LEVEL1-(Assn)-LockScreen
//
//  Created by 강우원 on 2023/01/17.
//

import SwiftUI

struct NumberButton: View {
    
    let number: Number
    
    var body: some View {
        Button {
            
        } label: {
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
        .foregroundColor(.white)
        .frame(width: 80, height: 80)
        .clipShape(Circle())
        
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
