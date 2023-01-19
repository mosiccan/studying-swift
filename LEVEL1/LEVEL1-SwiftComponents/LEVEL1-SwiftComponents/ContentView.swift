//
//  ContentView.swift
//  LEVEL1-SwiftComponents
//
//  Created by 강우원 on 2023/01/16.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID() // UUID 를 사용하면 매번 객체가 생성될 때 Unique Identifier 를 만들 수 있다
    let name : String
    let imageName: String
}

struct ContentView: View {
    @State var name: String = ""
    var body: some View {
        
//        let people: [Person] = [Person(name: "Djokovic", imageName: "crown"),
//                                Person(name: "Federer",imageName: "crown"),
//                                Person(name: "Nadal",imageName: "crown"),
//                                Person(name: "Nadal",imageName: "crown"),]
         
//        List {
//            Section {
//                HStack {
//                    Image(systemName: "crown.fill")
//                    Text("Djokovic")
//                }
//                HStack {
//                    Image(systemName: "crown.fill")
//                    Text("Federer")
//                }
//                HStack {
//                    Image(systemName: "crown.fill")
//                    Text("Nadal")
//                }
//                HStack {
//                    Image(systemName: "crown.fill")
//                    Text("Murray")
//                }
//            } header: {
//                Text("Big 4")
//            }
//
//
//            Section {
//                HStack {
//                    Image(systemName: "crown")
//                    Text("Auger Aliassime")
//                }
//                HStack {
//                    Image(systemName: "crown")
//                    Text("Sinner")
//                }
//                HStack {
//                    Image(systemName: "crown")
//                    Text("Shapovalov")
//                }
//            } header: {
//                Text("Next Generation")
//            } footer: {
//                Text("내가 생각하는 3명")
//            }
//
//
//        }
        VStack {
            Image(systemName: "tennisball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(.green )
                .padding(20 )
                .background(.black)
            Image(systemName: "tennisball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(.green )
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
