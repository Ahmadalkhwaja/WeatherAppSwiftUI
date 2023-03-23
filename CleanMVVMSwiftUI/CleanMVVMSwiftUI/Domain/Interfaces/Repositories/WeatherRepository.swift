//
//  WeatherRepository.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation

protocol WeatherRepository {
    func fetchWeatherForCity(query: RegionQuery,
                             completion: @escaping (Result<WeatherUpdateModel, Error>) -> Void)
}
