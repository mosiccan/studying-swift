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
            BackgroundView()
            
            ScrollView {
                MainWeatherView()
                
                BlurStackView {
                    Text("Cloudy conditions will continue for the rest of the day. Wind gust are up to 5 m/s.")
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
                    VStack {
                        ForEach(forecast) { dayForecast in
                            VStack {
                                HStack {
                                    Text(dayForecast.day)
                                    
                                    Image(systemName: dayForecast.imageName)
                                        .symbolRenderingMode(.multicolor)
                                    
                                    Text("\(dayForecast.lowTemperture.description)°") // 숫자 이므로 .description
                                    
                                    ZStack {
                                        Capsule()
                                            .foregroundColor(.white)
                                        
                                        GeometryReader { proxy in
                                            Capsule()
                                                .fill(.linearGradient(Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing))
                                                .frame(width: dayForecast.arrange)
                                        }
                                    }
                                    
                                    Text("\(dayForecast.highTemperture.description)°")
                                }
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
                    VStack {
                        HStack {
                            Text("Today")
                            Image(systemName: "cloud.fill")
                            Text("-4°")
                            Text("9°")
                        }
                        HStack {
                            Text("Today")
                            Image(systemName: "cloud.fill")
                            Text("-4°")
                            Text("9°")
                        }
                        HStack {
                            Text("Today")
                            Image(systemName: "cloud.fill")
                            Text("-4°")
                            Text("9°")
                        }
                        HStack {
                            Text("Today")
                            Image(systemName: "cloud.fill")
                            Text("-4°")
                            Text("9°")
                        }
                    }
                    
                }
                
                HStack {
                    BlurStackView {
                        HStack {
                            Image(systemName: "thermometer.medium")
                            Text("FEELS LIKE")
                        }
                        
                    } contentView: {
                        VStack (alignment: .leading) {
                            TitleLabel(titleText: "3°")
                            Spacer()
                            Text("Wind is making it feel colder.")
                        }
                    }
                    
                    BlurStackView {
                        HStack {
                            Image(systemName: "humidity")
                            Text("HUMIDITY")
                        }
                        
                    } contentView: {
                        VStack (alignment: .leading)  {
                            TitleLabel(titleText: "71%")
                            Spacer()
                            Text("The dew point is -1° right now.")
                        }
                    }

                }
            }
        }
    }
    
    @ViewBuilder
    func BackgroundView() -> some View {
        GeometryReader { geometry in
            Image("cloud")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func MainWeatherView() -> some View {
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
        .foregroundColor(.white)
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
    }
    
    private func setOpacity() -> CGFloat {
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
