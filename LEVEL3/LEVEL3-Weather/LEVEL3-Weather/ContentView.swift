//
//  ContentView.swift
//  LEVEL3-Weather
//
//  Created by 강우원 on 2023/02/12.
//

import SwiftUI

struct ContentView: View {
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("cloud")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
            .ignoresSafeArea()
            
            
            ScrollView {
                VStack {
                    if offset < 50 {
                        Text("Daejeon")
                            .font(.title)
                    } else {
                        VStack {
                            Text("Daejeon")
                                .font(.title)
                            HStack {
                                Text("6°")
                                    .font(.title3)
                                Text("Cloudy")
                                    .font(.title3)
                            }
                        }
                        
                    }
                    
                    Text("6°")
                        .font(.system(size: 100, weight: .thin))
                        .opacity(setOpacity())
                    Text("Cloudy")
                        .font(.title3)
                        .opacity(setOpacity())
                    HStack {
                        Text("H:9°")
                            .font(.title3)
                            .opacity(setOpacity())
                        Text("L:-4°")
                            .font(.title3)
                            .opacity(setOpacity())
                    }
                }
                .offset(y: -offset + 70)
                .background(
                    GeometryReader(content: { geometry ->
                        Color in
                        
                        let minY = geometry.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            offset  = minY
                        }
                        
                        return Color.clear
                    })
                )
                
                BlurStackView {
                    Text("Cloudy conditions will continue for the rest of the day. Wind gust are up to 5 m/s")
                } contentView: {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 36){
                                ForecastView(time: "Now", celsius: 6, imageName: "cloud.fill")
                                ForecastView(time: "19", celsius: 6, imageName: "cloud.fill")
                                ForecastView(time: "20", celsius: 5, imageName: "cloud.fill")
                                ForecastView(time: "21", celsius: 4, imageName: "cloud.fill")
                                ForecastView(time: "22", celsius: 4, imageName: "cloud.fill")
                                ForecastView(time: "23 ", celsius: 5, imageName: "cloud.fill")
                            }
                            
                        }
                    }
                }
                
                BlurStackView {
                    HStack {
                        Image(systemName: "calendar")
                        Text("10-DAY FORECAST")
                    }
                } contentView: {
                    //
                    
                }
                
//                VStack {
//                    HStack {
//                        Image(systemName: "calendar")
//                        Text("10-DAY FORECAST")
//                    }
//                    Divider()
//                    VStack {
//                        HStack {
//                            Text("Today")
//                            Image(systemName: "cloud.fill")
//                            Text("-4°")
//                            Text("9°")
//                        }
//                        HStack {
//                            Text("Today")
//                            Image(systemName: "cloud.fill")
//                            Text("-4°")
//                            Text("9°")
//                        }
//                        HStack {
//                            Text("Today")
//                            Image(systemName: "cloud.fill")
//                            Text("-4°")
//                            Text("9°")
//                        }
//                        HStack {
//                            Text("Today")
//                            Image(systemName: "cloud.fill")
//                            Text("-4°")
//                            Text("9°")
//                        }
//                        HStack {
//                            Text("Today")
//                            Image(systemName: "cloud.fill")
//                            Text("-4°")
//                            Text("9°")
//                        }
//                    }
//                }
//                .padding()
//                .background(.green)
//                .cornerRadius(13)
                
            }
        }
    }
    
    func setOpacity() -> CGFloat {
        if offset < 70 {
            return offset / 70
        } else {
            return 1
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
