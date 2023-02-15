//
//  BlurStackView.swift
//  LEVEL3-Weather
//
//  Created by 강우원 on 2023/02/13.
//

import SwiftUI

struct BlurStackView<Header: View, Content: View>: View {
    
    var headerView: Header
    var contentView: Content
    
    @State var topOffset: CGFloat = 0
    @State var bottomOffset: CGFloat = 0
    
    init(@ViewBuilder headerView: @escaping () -> Header,
         @ViewBuilder contentView: @escaping () -> Content  ) {
        self.headerView = headerView()
        self.contentView = contentView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(.white)
                .background(.ultraThinMaterial, in: IndividualCorner(corners: bottomOffset < 35 ? .allCorners : [.topLeft, .topRight], radius: 16))
                .zIndex(1)
            Divider()
            contentView
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(.ultraThinMaterial, in: IndividualCorner(corners: [.bottomLeft, .bottomRight], radius: 16))
                .offset(y: topOffset >= 200 ? 0 : topOffset - 200)
                .zIndex(0)
                .clipped() 
        }
        .opacity(getOpacity())
        .offset(y: topOffset >= 200 ? 0 : -(topOffset - 200))
        .background(
            GeometryReader(content: { geometry ->
                Color in
                
                let minY = geometry.frame(in: .global).minY
                let maxY = geometry.frame(in: .global).maxY
                
                DispatchQueue.main.async {
                    topOffset  = minY
                    bottomOffset = maxY - 240
                }
                
                return Color.clear
            })
        )
        .padding()
        .cornerRadius(30)
    }
    
    private func getOpacity() -> CGFloat {
        if bottomOffset < 35 {
            let progress = bottomOffset / 35
            return progress
        } else {
            return 1
        }
    }
}

struct BlurStackView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
