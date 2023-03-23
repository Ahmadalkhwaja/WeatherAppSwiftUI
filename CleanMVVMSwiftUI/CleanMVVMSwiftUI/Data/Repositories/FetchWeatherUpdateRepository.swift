//
//  FetchWeatherUpdateRepository.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation

class FetchWeatherUpdateRepository {
    let networkService: NetworkManagerProtocol
    init(networkService: NetworkManagerProtocol) {
        // caching storage service can be injected here.
        self.networkService = networkService
    }
}

extension FetchWeatherUpdateRepository: WeatherRepository {
    func fetchWeatherForCity(query: RegionQuery, completion: @escaping (Result<WeatherUpdateModel, Error>) -> Void) {
        let apiEndpoint = APIEndpoints.getWeatherUpdates(query: query)
        networkService.request(router: apiEndpoint, completionBlock: { response in
            switch response.result {
            case let .success(data):
                let decoder = JSONDecoder.init()
                let weather = try! decoder.decode(WeatherUpdateModel.self, from: data)
                completion(.success(weather))
            case let .failure(error):
                // the error should be handled here
                completion(.failure(error))
                break
            }
        })
    }
}
