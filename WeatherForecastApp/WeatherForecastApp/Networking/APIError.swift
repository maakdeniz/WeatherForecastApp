//
//  APIError.swift
//  WeatherForecastApp
//
//  Created by Mehmet Akdeniz on 17.11.2023.
//

import Foundation

enum APIError: Error {
    case decodingError
    case serverError(String)
    case unknownError(Error)
    case customError(String)
    
    var errorTitle: String {
        switch self {
        case .decodingError:
            return "Unknown error"
        case .serverError(let string):
            return string
        case .unknownError(let error):
            return error.localizedDescription
        case .customError(let message):
            return message
        }
    }
}
