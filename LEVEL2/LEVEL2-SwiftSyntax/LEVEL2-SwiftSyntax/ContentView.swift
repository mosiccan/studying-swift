//
//  ContentView.swift
//  LEVEL2-SwiftSyntax
//
//  Created by 강우원 on 2023/01/31.
//

import SwiftUI

struct ContentView: View {
    let name: String
    let age: Int? 
    var body: some View {
        VStack {
            Text(name)
            if let age = age {
                Text(age.description)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "WOO", age: 20)
    }
}
