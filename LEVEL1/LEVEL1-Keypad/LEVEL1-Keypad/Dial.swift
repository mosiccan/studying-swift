//
//  Dial.swift
//  LEVEL1-Keypad
//
//  Created by 강우원 on 2023/01/10.
//

import Foundation
import SwiftUI

struct  Dial: Identifiable, Hashable {
    var id = UUID()
    var mainNumber: String
    var subAlphabet: [String]
    var buttonColor: Color? = .gray
    
}

var dialDummy = [[Dial(mainNumber: "1",
                       subAlphabet: [""]),
                  Dial(mainNumber: "2",
                       subAlphabet: ["A", "B", "C"]),
                  Dial(mainNumber: "3",
                       subAlphabet: ["D", "E", "F"])],
                 [Dial(mainNumber: "4",
                       subAlphabet: ["G", "H", "I"]),
                  Dial(mainNumber: "5",
                       subAlphabet: ["J", "K", "L"]),
                  Dial(mainNumber: "6",
                       subAlphabet: ["M", "N", "O"])],
                 [Dial(mainNumber: "7",
                       subAlphabet: ["P", "Q", "R", "S"]),
                  Dial(mainNumber: "8",
                       subAlphabet: ["T", "U", "V"]),
                  Dial(mainNumber: "9",
                       subAlphabet: ["W", "X", "Y", "Z"])],
                 [Dial(mainNumber: "*",
                       subAlphabet: ["G", "H", "I"]),
                  Dial(mainNumber: "0",
                       subAlphabet: ["+"]),
                  Dial(mainNumber: "#",
                       subAlphabet: ["G", "H", "I"])],
                 [Dial(mainNumber: "c",
                       subAlphabet: [""], buttonColor: .green)]
                 
]
