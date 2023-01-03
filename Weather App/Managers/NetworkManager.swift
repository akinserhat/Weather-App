//
//  NetworkManager.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 3.01.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let appid = "257a7958929f9a6fcab8e0b3070babda"
    
    private init() {}
    
    func fetchCityData(for cityName: String) {
        let endpoint = baseURL + "?q=\(cityName)&appid=\(appid)"
        guard let url = URL(string: endpoint) else {
            print("error")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                print("error")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("error")
                return
            }
            
            guard let data = data else {
                print("error")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let weathers = try decoder.decode(WeatherData.self, from: data)
                print(weathers.wind.speed)
            } catch {
                print("error")
            }
        }
        
        task.resume()
    }
}
