//
//  Number.swift
//  LEVEL1-(Assn)-LockScreen
//
//  Created by 강우원 on 2023/01/17.
//

import Foundation
import SwiftUI

struct Number: Identifiable, Hashable {
    var id = UUID()
    var mainNumber: String
    var subAlphabet: [String]
    var buttonMaterial: Material? = .ultraThin
    
    static func == (lhs: Number, rhs: Number) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

var numberDummy = [[Number(mainNumber: "1", subAlphabet: [""]),
                    Number(mainNumber: "2", subAlphabet: ["A","B","C"]),
                    Number(mainNumber: "3", subAlphabet: ["D","E","F"])],
                   [Number(mainNumber: "4", subAlphabet: ["G","H","I"]),
                    Number(mainNumber: "5", subAlphabet: ["J","K","L"]),
                    Number(mainNumber: "6", subAlphabet: ["M","N","O"])],
                   [Number(mainNumber: "7", subAlphabet: ["P","Q","R","S"]),
                    Number(mainNumber: "8", subAlphabet: ["T","U","V"]),
                    Number(mainNumber: "9", subAlphabet: ["W","X","Y","Z"])],
                   [Number(mainNumber: "", subAlphabet: [""], buttonMaterial: nil),
                    Number(mainNumber: "0", subAlphabet: [""]),
                    Number(mainNumber: "", subAlphabet: [""], buttonMaterial: nil)],
]
