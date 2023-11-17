//
//  Endpoint.swift
//  WeatherForecastApp
//
//  Created by Mehmet Akdeniz on 17.11.2023.
//

import Foundation
import Moya

enum Endpoint {
    case getCityWeather(CityRequestData)
    case getLocationWeather(LocationRequestData)
}

extension Endpoint: TargetType {
    var baseURL: URL { URL(string: "https://api.openweathermap.org/data/2.5")! }
    
    var path: String {
        switch self {
        case .getCityWeather: return "/weather"
        case .getLocationWeather: return "/weather"
        }
    }
    
    var method: Moya.Method { .get }
    
    var task: Moya.Task {
        switch self {
        case .getCityWeather(let requestData):
            return .requestParameters(parameters: requestData.toDictionary(), encoding: URLEncoding.queryString)
        case .getLocationWeather(let requestData):
            return .requestParameters(parameters: requestData.toDictionary(), encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? { ["Content-Type": "application/json"] }
}

