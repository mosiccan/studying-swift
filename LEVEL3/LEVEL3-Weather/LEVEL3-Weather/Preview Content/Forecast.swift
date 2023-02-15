//
//  Forecast.swift
//  LEVEL3-Weather
//
//  Created by 강우원 on 2023/02/15.
//

import Foundation

struct Forecast: Identifiable {
    var id = UUID()
    let day: String
    let lowTemperture: Int
    let highTemperture: Int
    let imageName: String
    let arrange: CGFloat
}

var forecast = [

    Forecast(day: "Today",
             lowTemperture: -2,
             highTemperture: 7,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Thu",
             lowTemperture: -1,
             highTemperture: 6,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Fri",
             lowTemperture: -3,
             highTemperture: 11,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Sat",
             lowTemperture: 3,
             highTemperture: 11,
             imageName: "cloud.rain.fill",
             arrange: 100),
    Forecast(day: "Sun",
             lowTemperture: -1,
             highTemperture: 7,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Mon",
             lowTemperture: -4,
             highTemperture: 6,
             imageName: "sun.max.fill",
             arrange: 100),
    Forecast(day: "Tue",
             lowTemperture: -5,
             highTemperture: 3,
             imageName: "sun.max.fill",
             arrange: 100),
    Forecast(day: "Wed",
             lowTemperture: -5,
             highTemperture: 6,
             imageName: "cloud.fill",
             arrange: 100),
    Forecast(day: "Thu",
             lowTemperture: -1,
             highTemperture: 10,
             imageName: "cloud.sun.fill",
             arrange: 100),
    Forecast(day: "Fri",
             lowTemperture: -2,
             highTemperture: 11,
             imageName: "sun.max.fill",
             arrange: 100),
]
