//
//  ContentView.swift
//  LEVEL1-(Assn)-LockScreen
//
//  Created by 강우원 on 2023/01/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("iPhone-14-Pro-Silver-wallpaper")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .blur(radius: 10)
            
            VStack(spacing: 0) {
                Spacer()
                ForEach(numberDummy, id: \.self) { items in
                    HStack {
                        ForEach(items, id: \.self){ item in
                            NumberButton(number: Number(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet))}
                    }
                }
                Spacer()
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
