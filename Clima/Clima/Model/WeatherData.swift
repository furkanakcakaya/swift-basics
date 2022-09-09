//
//  WeatherData.swift
//  Clima
//
//  Created by Furkan Akçakaya | @axdevelops on 7.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct Main : Codable{
    let temp: Double
    let humidity: Int
}

struct Weather : Codable{
    let id: Int
}
