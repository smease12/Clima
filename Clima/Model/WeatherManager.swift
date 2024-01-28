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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a url
        
        if let url = URL(string: urlString){
            
            //2. Create a URLsession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            getConditionName(weatherId: id)
        } catch{
            print(error)
        }
    }
    
    func getConditionName(weatherId: Int){
        switch weatherId{
        case 200..<233:
            print("cloud.bolt.rain")
        case 300..<532:
            print("cloud.rain")
        case 600..<623:
            print("cloud.snow")
        case 800:
            print("sun.max")
        default:
            print("cloud")
        }
    }
    
}
