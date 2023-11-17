//
//  WeatherResponse.swift
//  WeatherForecastApp
//
//  Created by Mehmet Akdeniz on 17.11.2023.
//

import Foundation

struct WeatherResponse: BaseDecodable {
    var userMessage: String?
    let coord: Coordinates
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let dt: Int
    let sys: Sys
    let name: String
    
    struct Coordinates: Decodable {
        let lon: Double
        let lat: Double
    }

    struct Weather: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct Main: Decodable {
        let temp: Double
        let pressure: Int
        let humidity: Int
    }

    struct Wind: Decodable {
        let speed: Double
        let deg: Int
    }

    struct Sys: Decodable {
        let country: String
        let sunrise: Int
        let sunset: Int
    }
}

