//
//  WeatherModel.swift
//  Clima
//
//  Created by Serena  on 1/27/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var conditionName: String{
        switch conditionId{
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
    }
}
