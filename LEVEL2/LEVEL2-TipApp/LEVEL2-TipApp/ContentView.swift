//
//  ContentView.swift
//  LEVEL2-TipApp
//
//  Created by 강우원 on 2023/02/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText: String = ""
    
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
                        NavigationLink {
                            Text("Detail Protect your information")
                        } label: {
                            HStack {
                                Image(systemName: "lock.shield")
                                    .resizable()
                                    .foregroundStyle(.linearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .scaledToFit()
                                    .frame(width: 20 , height: 20)
                                    
                                Text("Protect your information")
                                    .padding(.leading, 10)
                            }
                            
                        }
                        
                        NavigationLink {
                            Text("Detail Be prepared")
                        } label: {
                            HStack {
                                Image(systemName: "lifepreserver")
                                    .resizable()
                                    .foregroundStyle(.linearGradient(colors: [.orange, .yellow], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                    .scaledToFit()
                                    .frame(width: 20 , height: 20)
                                Text("Be prepared")
                                    .padding(.leading, 10)
                            }
                        }
                        
                        NavigationLink {
                            Text("Detail Set up essentials")
                        } label: {
                            HStack {
                                Image(systemName: "star")
                                    .resizable()
                                    .foregroundStyle(.linearGradient(colors: [.red, .orange], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                    .scaledToFit()
                                    .frame(width: 20 , height: 20)
                                Text("Set up essentials")
                                    .padding(.leading, 10)
                            }
                            
                        }
                        
                        NavigationLink {
                            Text("Detail Personalize your iPhone")
                        } label: {
                            HStack {
                                Image(systemName: "heart")
                                    .resizable()
                                    .foregroundStyle(.linearGradient(colors: [.purple, .pink], startPoint: .bottomLeading, endPoint: .topTrailing))
                                    .scaledToFit()
                                    .frame(width: 20 , height: 20)
                                Text("Personalize your iPhone")
                                    .padding(.leading, 10)
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
                        NavigationLink {
                            Text("Detail Personalize your iPhone")
                        } label: {
                            
                            HStack {
                                Image(systemName: "sparkles")
                                    .resizable()
                                    .foregroundStyle(.linearGradient(colors: [.blue, .green], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                    .scaledToFit()
                                    .frame(width: 20 , height: 20)
                                Text("What's new in iOS16")
                                    .padding(.leading, 10)
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
                        NavigationLink {
                            Text("Detail Photos")
                        } label: {
                            HStack {
                                Image(systemName: "photo.on.rectangle.angled")
                                    .resizable()
                                    .foregroundStyle(.linearGradient(colors: [.purple, .pink], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                    .scaledToFit()
                                    .frame(width: 20 , height: 20)
                                Text("Photos")
                                    .padding(.leading, 10)
                            }
                        }
                        
                        NavigationLink {
                            Text("Detail camera")
                        } label: {
                            HStack {
                                Image(systemName: "camera")
                                    .resizable()
                                    .foregroundStyle(.linearGradient(colors: [.orange, .yellow], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                    .scaledToFit()
                                    .frame(width: 20 , height: 20)
                                Text("Camera")
                                    .padding(.leading, 10)
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
