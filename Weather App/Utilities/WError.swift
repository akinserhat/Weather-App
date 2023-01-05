//
//  WError.swift
//  Weather App
//
//  Created by Akın Serhat Göksel on 5.01.2023.
//

import Foundation

enum WError: String, Error {
    case invalidCityName = "Invalid city name. Please try again."
    case requestError = "Request error. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "Invalid data. Please try again."
    
}
