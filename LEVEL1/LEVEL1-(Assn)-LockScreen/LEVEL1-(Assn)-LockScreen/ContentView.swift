//
//  ContentView.swift
//  LEVEL1-(Assn)-LockScreen
//
//  Created by 강우원 on 2023/01/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputNumber: String = ""
    
    var body: some View {
        ZStack{
            Image("iPhone-14-Pro-Silver-wallpaper")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .blur(radius: 10)
            
            VStack(spacing: 18) {
                Spacer()
                // lock 이미지
                Image(systemName: "lock.fill")
                    .foregroundColor(.white)
                
                Spacer()
                Text("Enter Passcode")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                HStack(spacing: 24) {
                    ForEach(0..<6) { number in
                        if inputNumber.count > number {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 13, height: 13)
                        } else {
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 13, height: 13)
                        }
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
                // Number 버튼 출력
                ForEach(numberDummy, id: \.self) { items in
                    HStack (spacing: 20) {
                        ForEach(items, id: \.self) { item in
                            NumberButton(number: Number(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet), buttonMaterial: item.buttonMaterial, inputNumber: $inputNumber)
                        }
                    }
                }
                
                Spacer()
                // Emergency, Cancel(Delete)
                HStack {
                    Spacer()
                    Button(action: {
                        // emergency action
                    }) {
                        Text("Emergency")
                            .font(.system(.body))
                    }
                    Spacer(minLength: 144)
                    Button(action: {
                        // delete action
                    }) {
                        Text("Cancel")
                            .font(.system(.body))
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .foregroundColor(.white)
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
