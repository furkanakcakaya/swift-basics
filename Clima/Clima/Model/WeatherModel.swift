//
//  WeatherModel.swift
//  Clima
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 8.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    var conditionId: Int
    var cityName: String
    var temperature: Double
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId{
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 801...808:
            return "cloud"
        case 800:
            return "sun.haze"
        default:
            return "cloud"
        }
        
    }
    
    
}
