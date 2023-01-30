//
//  ContentView.swift
//  LEVEL2-Setting
//
//  Created by 강우원 on 2023/01/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAirplaneModeOn: Bool = false
    @State private var isVPNOn: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("Profile")
                    } label: {
                        profileCell()
                    }
                }
                
                Section {
                    toggleCell(imageName: "airplane", iconColor: .orange,
                               cellTitle: "  Airplane Mode", isModeOn: $isAirplaneModeOn)
                    navigationLinkCell (imageName: "wifi",
                               iconColor: .blue,
                               cellTitle:  "  Wi-Fi",
                               subTitle: "KT_GIGA_BE95") {
                        Text("Wifi display")
                    }
                    HStack {
                        Image(systemName: "hourglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 5)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        NavigationLink {
                            Text("Display Blue-Tooth")
                        } label: {
                            HStack {
                                Text("  Bluetooth")
                                Spacer()
                                Text("On")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 5)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        NavigationLink {
                            Text("Display Cellular")
                        } label: {
                            HStack {
                                Text("  Cellular")
                                Spacer()
                                Text("Off")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "personalhotspot")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        NavigationLink {
                            Text("Display Personal Hotspot")
                        } label: {
                            HStack {
                                Text("  Personal Hotspot")
                                Spacer()
                                Text("Off")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    HStack {
                        ZStack {
                            Image(systemName: "none")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Text("VPN")
                                .foregroundColor(.white)
                                .font(.custom("SF Pro Display", size: 12))
                        }
                        
                        
                        Toggle("  VPN", isOn: $isVPNOn)
                    }
                    
                }
                
                Section {
                    navigationLinkCell(imageName: "gear",
                              iconColor: .gray,
                              cellTitle: "  General") {
                        Text("Display General")
                    }
                    navigationLinkCell(imageName: "figure.arms.open",
                              iconColor: .blue,
                              cellTitle: "  Accessibility") {
                        Text("Display Accessibility")
                    }
                    navigationLinkCell(imageName: "hand.raised.fill",
                              iconColor: .blue,
                              cellTitle: "  Privacy & Security") {
                        Text("Display Privacy & Security")
                    }
                }
                
                navigationLinkCell(imageName: "key.fill", iconColor: .gray,
                          cellTitle: "  Passwords") {
                    Text("Display Passwords")
                    // gray
                }
            }.navigationTitle("Settings")
        }
    }
    
    @ViewBuilder
    private func iconImage(imageName: String, iconColor: Color) -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 5)
            .background(iconColor)
            .foregroundColor(.white )
            .cornerRadius(6)
    }
    
    @ViewBuilder
    private func profileCell() -> some View {
        HStack {
            Image(systemName: "tennisball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 54, height: 54)
                .background(.green)
                .clipShape(Circle())
            VStack (alignment: .leading) {
                Text(" Woowon Kang")
                    .font(.title2)
                Text("  Apple ID, iCloud, Media & Purchases")
                    .font(.system(size: 13))
            }
            
        }
        .padding(.vertical, -5)
    }
    
    @ViewBuilder
    private func toggleCell(imageName: String, iconColor: Color, cellTitle: String, isModeOn: Binding<Bool>) -> some View {
        HStack {
            iconImage(imageName: imageName, iconColor: iconColor)
            Toggle(cellTitle, isOn: $isAirplaneModeOn)
        }
    }
    
    
    @ViewBuilder
    private func navigationLinkCell<V: View>(imageName: String, iconColor: Color,
                                    cellTitle: String, subTitle: String? = nil,
                                    destination: @escaping() -> V) -> some View {
        HStack {
            iconImage(imageName: imageName, iconColor: iconColor)
            if let subTitle = subTitle {
                NavigationLink{
                    destination()
                } label: {
                    HStack {
                        Text(cellTitle)
                        Spacer()
                        Text(subTitle)
                            .foregroundColor(.gray)
                    }
                }
            } else {
                NavigationLink(cellTitle){
                    destination()
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

