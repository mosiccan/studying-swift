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
    var body: some View {
        
        let people: [Person] = [Person(name: "Djokovic", imageName: "crown"),
                                Person(name: "Federer",imageName: "crown"),
                                Person(name: "Nadal",imageName: "crown"),
                                Person(name: "Nadal",imageName: "crown"),]
        List(people) { person in
            HStack {
                Image(systemName: person.imageName)
                Text(person.name)
                
            }
             
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
