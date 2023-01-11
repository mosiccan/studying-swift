//
//  DialButton.swift
//  LEVEL1-Keypad
//
//  Created by 강우원 on 2023/01/10.
//

import SwiftUI

struct DialButton: View {
    
    let dialNumber: Dial
    
    var body: some View {
        
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Text(dialNumber.mainNumber)
                    .font(.system(.title))
                    .padding(.vertical, -3)
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
                .background(.gray)
                .clipShape(Circle())
        }
         
    }
}

struct DialButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
