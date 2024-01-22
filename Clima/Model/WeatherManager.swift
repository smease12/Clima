//
//  WeatherManager.swift
//  Clima
//
//  Created by Serena  on 1/21/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=427923459170229f720342da44724965&units=metric"
    
    func fetchWeater(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
    
}
