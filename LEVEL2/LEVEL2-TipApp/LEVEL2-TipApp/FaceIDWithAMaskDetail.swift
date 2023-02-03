//
//  FaceIDWithAMaskDetail.swift
//  LEVEL2-TipApp
//
//  Created by 강우원 on 2023/02/03.
//

import SwiftUI

struct FaceIDWithAMaskDetail: View {
    
    @State var selectedPage = 0
    
    var body: some View {
        
        ScrollView {
            HStack {
                TabView {
                    VStack {
                        Spacer()
                        Image("example1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240)
                            .padding(.bottom, 30)
                        
                        VStack(alignment: .leading){
                            Text("Add Face ID with a mask")
                                .font(.title3)
                                .bold()
                                .padding(.bottom, 3)
                            Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternate appearance, like glasses or a mask, go to Setings, then tap Face ID & Passcode.")
                                .font(.system(size: 15))
                        }
                        .lineSpacing(4)
                        .frame(width: 320)
                        
                        Button {
                            //
                        } label: {
                            Text("Review Face ID Settings")
                                .font(.system(size: 16))
                        }
                        .frame(width: 200, height: 40)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(24)
                        
                        Spacer()
                    }
                    .navigationTitle("Protect your information")
                    .toolbar {
                        Button {
                            // clicked bookmark
                        } label: {
                            Image(systemName: "bookmark")
                        }
                    }
                    
                    VStack {
                        Spacer()
                        Image("example2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240)
                            .padding(.bottom, 30)
                        
                        VStack(alignment: .leading){
                            Text("Add Face ID with a mask")
                                .font(.title3)
                                .bold()
                                .padding(.bottom, 3)
                            Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternate appearance, like glasses or a mask, go to Setings, then tap Face ID & Passcode.")
                                .font(.system(size: 15))
                        }
                        .lineSpacing(4)
                        .frame(width: 320)
                        
                        Button {
                            //
                        } label: {
                            Text("Review Face ID Settings")
                                .font(.system(size: 16))
                        }
                        .frame(width: 200, height: 40)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(24)
                        
                        Spacer()
                    }
                    .navigationTitle("Protect your information")
                    .toolbar {
                        Button {
                            // clicked bookmark
                        } label: {
                            Image(systemName: "bookmark")
                        }
                    }
                    
                    VStack {
                        Spacer()
                        Image("example3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240)
                            .padding(.bottom, 30)
                        
                        VStack(alignment: .leading){
                            Text("Add Face ID with a mask")
                                .font(.title3)
                                .bold()
                                .padding(.bottom, 3)
                            Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternate appearance, like glasses or a mask, go to Setings, then tap Face ID & Passcode.")
                                .font(.system(size: 15))
                        }
                        .lineSpacing(4)
                        .frame(width: 320)
                        
                        Button {
                            //
                        } label: {
                            Text("Review Face ID Settings")
                                .font(.system(size: 16))
                        }
                        .frame(width: 200, height: 40)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(24)
                        
                        Spacer()
                    }
                    .navigationTitle("Protect your information")
                    .toolbar {
                        Button {
                            // clicked bookmark
                        } label: {
                            Image(systemName: "bookmark")
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-60)
                .tabViewStyle(.page(indexDisplayMode: .always))
            }
            
        }
    
    }
}

//struct PageControl: View {
//    var numberOfPages: Int
//    @Binding var currentPage: Int
//    var body: some View {
//        HStack {
//            ForEach(0 ..< numberOfPages) { index in
//                Circle()
//                    .frame(width: 8, height: 8)
//                    .foregroundColor(index == self.currentPage ? .white : .gray)
//                    .padding(.horizontal, 2)
//                    .onTapGesture (perform: {
//                        self.currentPage = index
//                    })
//
//            }
//        }
//    }
//}

struct FaceIDWithAMaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        FaceIDWithAMaskDetail()
    }
}
