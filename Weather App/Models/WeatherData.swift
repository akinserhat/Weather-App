//
//  WeatherData.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 3.01.2023.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}
