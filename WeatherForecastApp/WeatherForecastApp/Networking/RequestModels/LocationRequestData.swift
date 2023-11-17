//
//  LocationRequestData.swift
//  WeatherForecastApp
//
//  Created by Mehmet Akdeniz on 17.11.2023.
//

import Foundation

struct LocationRequestData: Encodable {
    let latitude: Double
    let longitude: Double
    let appId: String = "b9f484c572cd9077117344870a4d10c7"

    func toDictionary() -> [String: Any] {
        return ["lat": latitude, "lon": longitude, "appid": appId]
    }
}
