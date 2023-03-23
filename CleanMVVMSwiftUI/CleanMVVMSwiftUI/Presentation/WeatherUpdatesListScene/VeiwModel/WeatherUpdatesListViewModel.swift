//
//  WeatherUpdatesListViewModel.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 23/03/2023.
//

import Foundation
import Combine

class WeatherUpdatesListViewModel: ObservableObject {
    @Published var forecastdays = [Forecastday]()
    @Published var regionName: String = "Amman"
    
    private var cancellables: Set<AnyCancellable> = []
    private var weatherUpdateUseCase: WeatherUpdateUseCase
    
    init(regionName: String = "", weatherUseCase: WeatherUpdateUseCase) {
        self.weatherUpdateUseCase = weatherUseCase
        $regionName
            .sink { [weak self] text in
                self?.load(regionName: text)
            }.store(in: &cancellables)
        self.regionName = regionName
    }
    func load(regionName: String) {
        let weatherUpdateRequestValue = WeatherUpdateUseCaseRequestValue(query: RegionQuery(query: regionName))
        weatherUpdateUseCase.execute(requestValue: weatherUpdateRequestValue, completion: { result in
            switch result {
            case .success(let data):
                self.forecastdays = data.forecast?.forecastday ?? []
            case .failure(_):
                break
            }
        })
    }
}
