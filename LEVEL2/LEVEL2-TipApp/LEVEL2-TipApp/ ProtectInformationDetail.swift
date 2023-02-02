//
//   ProtectInformationDetail.swift
//  LEVEL2-TipApp
//
//  Created by 강우원 on 2023/02/02.
//

import SwiftUI

struct ProtectInformationDetail: View {
    var body: some View {
            List {
                VStack {
                    Image(systemName: "person.badge.shield.checkmark.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    Text("Protect your information")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical, 1)
                    Text("Learn how iPhone keeps your ingormation secure and private.")
                        .foregroundColor(Color(UIColor.systemGray))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15))
                }
                .frame(height: 400)
                .padding(.leading, 8)
                .listRowBackground(LinearGradient(stops: [
                    .init(color: Color(UIColor.systemGreen), location: 0),
                    .init(color: Color(UIColor.systemTeal), location: 1)
                ], startPoint: .leading, endPoint: .trailing).mask(LinearGradient(stops: [
                    .init(color: .black, location: 0),
                    .init(color: .clear, location: 1)
                ], startPoint: .top, endPoint: .bottom)))
                
                NavigationLink {
                    Text("Detail Add Face ID with a mask")
                } label: {
                    HStack {
                        Image("addFaceIDwithAMaskIcon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .padding(.leading, -3)
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Add Face ID with a mask")
                                .font(.callout)
                                .fontWeight(.medium)
                                .padding(.vertical, 0.1)
                            
                            Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternte appearance like glasses or...")
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.system(size: 12))
                        }.lineSpacing(4)
                    }
                }
                
                NavigationLink {
                    Text("Detail Add Face ID with a mask")
                } label: {
                    HStack {
                        Image("addFaceIDwithAMaskIcon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .padding(.leading, -3)
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Add Face ID with a mask")
                                .font(.callout)
                                .fontWeight(.medium)
                                .padding(.vertical, 0.1)
                            
                            Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternte appearance like glasses or...")
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.system(size: 12))
                        }.lineSpacing(4)
                    }
                }
                
                NavigationLink {
                    Text("Detail Add Face ID with a mask")
                } label: {
                    HStack {
                        Image("addFaceIDwithAMaskIcon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .padding(.leading, -3)
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Add Face ID with a mask")
                                .font(.callout)
                                .fontWeight(.medium)
                                .padding(.vertical, 0.1)
                            
                            Text("Glance at your iPhone to unlock it, use Apple Pay, and more. To set up an alternte appearance like glasses or...")
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.system(size: 12))
                        }.lineSpacing(4)
                    }
                }
            }
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.top)
        
        }
    }


struct ProtectInformationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProtectInformationDetail()
        }
    }
}
