//
//  ContentView.swift
//  LEVEL1-Keypad
//
//  Created by 강우원 on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputNumber: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(inputNumber)
                    .font(.system(size: 32))
                    .padding(.vertical, 10)
                if inputNumber != "" {
                    Text("Add Number")
                        .foregroundColor(.blue)
                }
            }
            .frame(height: 200)
            
            Spacer()
            ForEach(dialDummy, id: \.self) { items in
                HStack {
                    ForEach(items, id: \.self) { item in
                        DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet), buttonColor: item.buttonColor, inputNumber: $inputNumber )
                    }
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
