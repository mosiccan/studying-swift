//
//  ContentView.swift
//  LEVEL1-Keypad
//
//  Created by 강우원 on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack {
                ForEach(dialDummy[0...2], id: \.self) { item in
                    DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
                }
            }
            HStack {
                ForEach(dialDummy[3...5], id: \.self) { item in
                    DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
                }
            }
            HStack {
                ForEach(dialDummy[6...8], id: \.self) { item in
                    DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
                }
            }
            HStack {
                ForEach(dialDummy[9...11], id: \.self) { item in
                    DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
                }
            }
            HStack {
                ForEach(dialDummy.suffix(1), id: \.self) { item in
                    DialButton(dialNumber: Dial(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))
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
