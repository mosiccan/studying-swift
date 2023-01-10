//
//  ContentView.swift
//  LEVEL1-SwiftSyntax
//
//  Created by 강우원 on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    
    var randomNumber: Int = 3
    let farmAnimals = ["🐴", "🐮", "🐷", "🐑"]
    @State var myMind: String = "nothing"
    @State var isChangedMind: Bool = false
    @State var yourGOAT: String = ""
    @State var menu: Menu = .Beef
    
    enum Big4 {
        case Djokovic
        case Nadal
        case Federer
        case Murray
    }
    
    enum Menu {
        case Beef, Pork, Chicken, Salmon, Lamb
    }
    
    var body: some View {
        VStack {
            //            ForEach(farmAnimals,
            //                    id: \.self) { animal in
            //                 Text(animal)
            //            }
            //            Text("___")
            //
            //            ForEach(0 ..< 5) { number in
            //                Text(number.description)
            //            }
            //            Text("___")
            //            Text("___")
            //            ForEach(farmAnimals, id: \.self) { s in
            //                Text(s)
            //            }
            
            //            Text(myMind)
            //            Button {
            //                isChangedMind.toggle()
            //                myMind = getMind(with: isChangedMind)
            //            } label: {
            //                Text("Change my mind!")
            //            }
//            Text("Djokovic")
//                .font(Font.largeTitle)
//                .fontWeight(.bold)
//            HStack {
//                Button {
//
//                } label: {
//                    Text("Djokovic")
//                        .frame(width: 80, height: 80)
//                        .background(.black)
//                        .cornerRadius(16)
//                        .foregroundColor(.white)
//                        .font(.system(size: 16))
//                }
//            }
            
            switch menu {
            case .Beef :
                Text("오늘 메뉴는 🐮")
            case .Pork :
                Text("오늘 메뉴는 🐷")
            case .Chicken :
                Text("오늘 메뉴는 🍗")
            default:
                Text("이건 못먹어요")
            }
        }
    
        
        
    }
    func getMind(with k: Bool) -> String {
        if k {
            return "always open"
        } else {
            return "but closed"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
