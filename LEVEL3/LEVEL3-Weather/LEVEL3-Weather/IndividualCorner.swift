//
//  IndividualCorner.swift
//  LEVEL3-Weather
//
//  Created by 강우원 on 2023/02/14.
//

import SwiftUI

struct IndividualCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius) )
        
        return Path(path.cgPath)
    }
}
