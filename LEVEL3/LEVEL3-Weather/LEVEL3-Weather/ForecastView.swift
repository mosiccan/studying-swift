//
//  ForecastView.swift
//  LEVEL3-Weather
//
//  Created by 강우원 on 2023/02/13.
//

import SwiftUI

struct ForecastView: View {
    
    var time: String
    var celsius: CGFloat
    var imageName: String
    
    var body: some View {
        VStack {
            Text(time)
                .bold()
            
            Image(systemName: imageName)
                .font(.title3)
                .symbolVariant(.fill)
                .symbolRenderingMode(.multicolor )
                .frame(height: 30)
            
            Text("\(Int(celsius))°")
                .bold()
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(time: "Now", celsius: 6, imageName: "cloud.fill")
    }
}
