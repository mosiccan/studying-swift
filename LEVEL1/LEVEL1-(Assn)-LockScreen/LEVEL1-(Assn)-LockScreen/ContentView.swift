//
//  ContentView.swift
//  LEVEL1-(Assn)-LockScreen
//
//  Created by 강우원 on 2023/01/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputNumber: String = ""
    @State var isDeleteMode = false
    @State var numberOfShakes: CGFloat = 0
    @State var shouldShake = false
    var myPassword = Password()
    @State var isCorrectPassword = false
    
    fileprivate func wallPaper() -> some View {
        return Image("iPhone-14-Pro-Silver-wallpaper")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 420)
            .blur(radius: 10)
    }
    
    fileprivate func passwordCheckCircles() -> some View {
        return HStack {
            if inputNumber.count == 6 && isCorrectPassword == false {
                HStack(spacing: 24) {
                    ForEach(0..<6) { number in
                        if inputNumber.count > number {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 13, height: 13)
                                .modifier(ShakeEffect(shakeNumber: numberOfShakes))
                                .onAppear {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        numberOfShakes = 3
                                    }
                                    numberOfShakes = 0
                                }
                        } else {
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 13, height: 13)
                                .modifier(ShakeEffect(shakeNumber: numberOfShakes))
                                .onAppear {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        numberOfShakes = 3
                                    }
                                    numberOfShakes = 0
                                }
                            
                        }
                    }
                }
            } else {
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
            }
        }
        .foregroundColor(.white)
    }
    
    fileprivate func keypadDialView() -> ForEach<[[Number]], [Number], HStack<ForEach<[Number], Number, NumberButton>>> {
        return ForEach(numberDummy, id: \.self) { items in
            HStack (spacing: 20) {
                ForEach(items, id: \.self) { item in
                    NumberButton(number: Number(mainNumber: item.mainNumber, subAlphabet: item.subAlphabet), buttonMaterial: item.buttonMaterial, inputNumber: $inputNumber, isCorrectPassword: $isCorrectPassword)
                }
            }
        }
    }
    
    fileprivate func tabBar() -> HStack<TupleView<(Spacer, Button<Text>, Spacer, Button<_ConditionalContent<Text, Text>?>, Spacer)>> {
        return HStack {
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
                if inputNumber.count > 0 {
                    isDeleteMode = true
                }
                if isDeleteMode == true {
                    inputNumber = String(inputNumber.dropLast())
                }
            }) {
                if inputNumber.count == 0 {
                    Text("Cancel")
                        .font(.system(.body))
                } else if inputNumber.count > 0 {
                    Text("Delete")
                        .font(.system(.body))
                }
                
            }
            Spacer()
        }
    }
    
    var body: some View {
        ZStack {
            wallPaper()
            VStack(spacing: 18) {
                Spacer()
                
                if isCorrectPassword {
                    Image(systemName: "lock.open.fill")
                        .foregroundColor(.white)
                } else {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.white)
                }
                Spacer()
                Text("Enter Passcode")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                passwordCheckCircles()
                Spacer()
                keypadDialView()
                Spacer()
                tabBar()
                Spacer()
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            Spacer()
        }
        
    }
    
}

struct ShakeEffect: AnimatableModifier {
    var shakeNumber: CGFloat = 0
    
    var animatableData: CGFloat {
        get {
            shakeNumber
        } set {
            shakeNumber = newValue
        }
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: sin(shakeNumber * .pi * 2) * 20)
    }
}

class Password {
    private var myPassword = "000000"
    func getMyValue() -> String {
        return myPassword
    }
    func setMyValue(newValue: String) {
        myPassword = newValue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
