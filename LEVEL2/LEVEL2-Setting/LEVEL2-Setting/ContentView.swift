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
                        airplaneToggleCell()
                        wifiTextCell()
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
                        plainCell(imageName: "gear",
                                  iconColor: .gray,
                                  cellTitle: "  General") {
                            Text("Display General")
                        }
                        plainCell(imageName: "figure.arms.open",
                                  iconColor: .blue,
                                  cellTitle: "  Accessibility") {
                            Text("Display Accessibility")
                        }
                        plainCell(imageName: "hand.raised.fill",
                                  iconColor: .blue,
                                  cellTitle: "  Privacy & Security") {
                            Text("Display Privacy & Security")
                        }
                    }
                    
                    plainCell(imageName: "key.fill", iconColor: .gray,
                              cellTitle: "  Passwords") {
                        Text("Display Passwords")
                        // gray
                    }
                }.navigationTitle("Settings")
            }
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
    private func airplaneToggleCell() -> some View {
        HStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 5)
                .background(.orange)
                .foregroundColor(.white)
                .cornerRadius(6)
            
            Toggle("  Airplane Mode", isOn: $isAirplaneModeOn)
        }
    }
    
    @ViewBuilder
    private func wifiTextCell() -> some View {
        HStack {
            Image(systemName: "wifi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 5)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(6)
            
            NavigationLink {
                Text("Display Screen Time")
            } label: {
                HStack {
                    Text("  Wi-Fi")
                    Spacer()
                    Text("KT_GIGA_BE95")
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    private func plainCell<V: View>(imageName: String, iconColor: Color, cellTitle: String, destination: @escaping() -> V) -> some View {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.all, 4)
                    .background(iconColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                NavigationLink(cellTitle){
                    destination()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

