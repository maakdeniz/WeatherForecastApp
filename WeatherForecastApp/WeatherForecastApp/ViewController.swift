//
//  ViewController.swift
//  WeatherForecastApp
//
//  Created by Mehmet Akdeniz on 17.11.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let requestData = CityRequestData(city: "Istanbul")
        let requestData2 = LocationRequestData(latitude: 37.0586575, longitude: 37.2153277)

        let api = API()
        api.fetch(endpoint: .getLocationWeather(requestData2)) { (result: Result<WeatherResponse, APIError>) in
            switch result {
            case .success(let weatherResponse):
                // Başarılı yanıt işleme
                print("Hava Durumu: \(weatherResponse)")
            case .failure(let error):
                // Hata işleme
                print("Hata: \(error.errorTitle)")
            }
        }
    }
}

