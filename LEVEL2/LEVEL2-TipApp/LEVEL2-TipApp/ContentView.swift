//
//  ContentView.swift
//  LEVEL2-TipApp
//
//  Created by 강우원 on 2023/02/01.
//

import SwiftUI

struct Collection: Identifiable {
    var id = UUID()
    let symbolName: String
    let symbolColor: [Color]
    let title: String
}

struct ContentView: View {
    
    @State var searchText: String = ""
    
    var startList: [Collection] = [Collection(symbolName: "lock.shield",
                                              symbolColor: [.blue, .green],
                                              title: "Protect your information"),
                                   Collection(symbolName: "lifepreserver",
                                              symbolColor: [.orange, .yellow],
                                              title: "Be prepared"),
                                   Collection(symbolName: "star",
                                              symbolColor: [.red, .orange],
                                              title: "Set up essentials"),
                                   Collection(symbolName: "heart",
                                              symbolColor: [.purple, .pink],
                                              title: "Personalize your iPhone")]
    var discoverMoreList: [Collection] = [Collection(symbolName: "sparkles",
                                                     symbolColor: [.blue, .green],
                                                     title: "What's new in iOS16")]
    var cameraList: [Collection] = [Collection(symbolName: "photo.on.rectangle.angled",
                                               symbolColor: [.purple, .pink],
                                               title: "Photos"),
                                    Collection(symbolName: "camera",
                                               symbolColor: [.orange, .yellow],
                                               title: "Camera")]
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ZStack {
                        Image("iphone-14")
                            .frame(height: 200)
                            .scaledToFit()
                        
                        
                        Text("Navigate your iPhone")
                            .offset(x: -64, y: -90)
                            .bold()
                            .font(.title3)
                    }
                    
                    Section {
                        ForEach(startList) { list in
                            NavigationLink {
                                ProtectInformationDetail()
                                    .background(Material.thick)
                            } label: {
                                HStack {
                                    Image(systemName: list.symbolName)
                                        .resizable()
                                        .foregroundStyle(.linearGradient(colors: list.symbolColor, startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .scaledToFit()
                                        .frame(width: 20 , height: 20)
                                    
                                    Text(list.title)
                                        .padding(.leading, 10)
                                }
                            }
                        }
                    } header: {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .textCase(nil)
                            .bold()
                            .font(.title3)
                    }
                    
                    Section {
                        ForEach(discoverMoreList) { list in
                            NavigationLink {
                                Text("Detail Discover More")
                                    .background(Material.thick)
                            } label: {
                                HStack {
                                    Image(systemName: list.symbolName)
                                        .resizable()
                                        .foregroundStyle(.linearGradient(colors: list.symbolColor, startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .scaledToFit()
                                        .frame(width: 20 , height: 20)
                                    
                                    Text(list.title )
                                        .padding(.leading, 10)
                                }
                            }
                        }
                    } header: {
                        Text("Discover More")
                            .foregroundColor(.white)
                            .textCase(nil)
                            .bold()
                            .font(.title3)
                    }
                    
                    Section {
                        
                        ForEach(cameraList) { list in
                            NavigationLink {
                                Text("Detail Photos")
                                    .background(Material.thick)
                            } label: {
                                HStack {
                                    Image(systemName: list.symbolName)
                                        .resizable()
                                        .foregroundStyle(.linearGradient(colors: list.symbolColor, startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .scaledToFit()
                                        .frame(width: 20 , height: 20)
                                    
                                    Text(list.title )
                                        .padding(.leading, 10)
                                }
                            }
                        }
                    } header: {
                        Text("Photos & Camera")
                            .foregroundColor(.white)
                            .textCase(nil)
                            .bold()
                            .font(.title3)
                    }
                    
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .navigationTitle("Collections")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
