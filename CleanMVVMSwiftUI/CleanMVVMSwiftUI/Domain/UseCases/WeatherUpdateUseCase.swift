//
//  WeatherUpdateUseCase.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 22/03/2023.
//

import Foundation

protocol WeatherUpdateUseCase {
    func execute(
        requestValue: WeatherUpdateUseCaseRequestValue,
        completion: @escaping (Result<WeatherUpdateModel, Error>) -> Void
    )
}

final class WeatherUpdateUseCaseImpl: WeatherUpdateUseCase {
    private let weatherRepositry: WeatherRepository
    
    init(weatherRepositry: WeatherRepository) {
        self.weatherRepositry = weatherRepositry
    }
    func execute(requestValue: WeatherUpdateUseCaseRequestValue, completion: @escaping (Result<WeatherUpdateModel, Error>) -> Void) {
        weatherRepositry.fetchWeatherForCity(query: requestValue.query, completion: { result in
            completion(result)
        })
    }
}

struct WeatherUpdateUseCaseRequestValue {
    let query: RegionQuery
}
