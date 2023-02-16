//
//  TitleLabel.swift
//  LEVEL3-Weather
//
//  Created by 강우원 on 2023/02/16.
//

import SwiftUI

struct TitleLabel: View {
    
    let titleText: String
    
    var body: some View {
        Text(titleText)
            .font(.title)
    }
}

struct TitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        TitleLabel(titleText: "sample")
    }
}
