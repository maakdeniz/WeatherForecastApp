//
//  API.swift
//  WeatherForecastApp
//
//  Created by Mehmet Akdeniz on 17.11.2023.
//

import Foundation
import Moya

protocol BaseDecodable: Decodable {
    var userMessage: String? { get }
}

final class API {
    private let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
    private lazy var provider = MoyaProvider<Endpoint>(plugins: [plugin])
    
    func fetch<T: BaseDecodable>(endpoint: Endpoint, completion: @escaping (Result<T, APIError>) -> Void) {
        provider.request(endpoint) { result in
            switch result {
            case .success(let response):
                do {
                    let model = try JSONDecoder().decode(T.self, from: response.data)
                    
                    if let message = model.userMessage {
                        completion(.failure(.serverError(message)))
                    } else {
                        completion(.success(model))
                    }
                } catch {
                    completion(.failure(.decodingError))
                }
                
            case .failure(let error):
                completion(.failure(.unknownError(error)))
            }
        }
    }
}
