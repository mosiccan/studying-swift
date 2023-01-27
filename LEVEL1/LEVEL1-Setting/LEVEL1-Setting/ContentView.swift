//
//  ContentView.swift
//  LEVEL1-Setting
//
//  Created by 강우원 on 2023/01/27.
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
                        
                        
                    }
                    
                    Section {
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
                        HStack {
                            Image(systemName: "gear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            
                            NavigationLink("  General"){
                                Text("Display General")
                            }
                        }
                        HStack {
                            Image(systemName: "figure.arms.open")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            
                            NavigationLink("  Accessibility"){
                                Text("Display Accessibility")
                            }
                        }
                        HStack {
                            Image(systemName: "hand.raised.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.all, 4)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            
                            NavigationLink("  Privacy & Security"){
                                Text("Display Privacy & Security")
                            }
                        }

                    }
                    HStack {
                        Image(systemName: "key.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        NavigationLink("  Passwords"){
                            Text("Display Passwords")
                        }
                    }
                }.navigationTitle("Settings")
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
