//
//  WeatherManager.swift
//  Clima
//
//  Created by Furkan Akçakaya | @axdevelops on 7.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weather: WeatherModel, _ manager: WeatherManager)
    func didFailWithError(_ error: Error)
}

struct WeatherManager{
    var api_key = "4536c1a7fb9864a0f1d17da42c9df130"
    var city = "Istanbul"
    var units = "metric"
    var api_url = "https://api.openweathermap.org/data/2.5/weather?"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(latitude: Double, longtitude: DoubleY){
        let url = "\(api_url)units=\(units)&appid=\(api_key)&lat=\(latitude)&lon=\(longtitude)"
        sendRequest(url)
    }
    
    func fetchWeather(cityName: String){
        let url = "\(api_url)q=\(cityName)&units=\(units)&appid=\(api_key)"
        sendRequest(url)
    }
    
    func sendRequest(_ urlString: String){
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(with: safeData){
                        self.delegate?.didUpdateWeather(weather, self)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func parseJSON(with data: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let city = decodedData.name
            
            return WeatherModel(conditionId: id, cityName: city, temperature: temp)
        }catch{
            print(error)
            return nil
        }
    }
    
}
