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
    
    func fetchCityData(for cityName: String, completed: @escaping (Result<WeatherData, WError>) -> Void) {
        let endpoint = baseURL + "?q=\(cityName)&appid=\(appid)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidCityName))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.requestError))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let weathers = try decoder.decode(WeatherData.self, from: data)
                completed(.success(weathers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
