//
//  WeatherUpdatesConfigurator.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 23/03/2023.
//

import Foundation

final class WeatherUpdatesConfigurator {
    //MARK: - Search Scene Dependencies
    public func configureWeatherUpdatesView() -> WeatherUpdatesView {
        let weatherUpdatesView = WeatherUpdatesView(viewModel: self.makeWeatherUpdatesViewModel())
        return weatherUpdatesView
    }
    func makeWeatherUpdatesViewModel() -> WeatherUpdatesViewModel {
        let viewModel: WeatherUpdatesViewModel = WeatherUpdatesViewModel(searchUseCase: makeSearchUseCase())
        return viewModel
    }
    private func makeSearchUseCase() -> SearchUseCase {
        let searchUseCase: SearchUseCase = SearchUseCaseImpl(searchRepository: makeSearchRepository())
        return searchUseCase
    }
    private func makeSearchRepository() -> SearchRepository {
        let searchRepository: SearchRepository = FetchSearchAutoCompleteRepository(networkService: makeSearchNetworkService())
        return searchRepository
    }
    private func makeSearchNetworkService() -> NetworkManagerProtocol {
        let searchNetworkService = NetworkManager()
        return searchNetworkService
    }
    //MARK: - Weather List Scene Dependencies
    public func configureWeatherUpdatesListView(regionName: String) -> WeatherUpdatesListView {
        let weatherUpdatesView = WeatherUpdatesListView(viewModel: self.makeWeatherUpdatesListViewModel(regionName: regionName))
        return weatherUpdatesView
    }
    func makeWeatherUpdatesListViewModel(regionName: String) -> WeatherUpdatesListViewModel {
        let viewModel: WeatherUpdatesListViewModel = WeatherUpdatesListViewModel(regionName: regionName, weatherUseCase: makeWeatherUpdatesListUseCase())
        return viewModel
    }
    private func makeWeatherUpdatesListUseCase() -> WeatherUpdateUseCase {
        let weatherUpdatesUseCase: WeatherUpdateUseCase = WeatherUpdateUseCaseImpl(weatherRepositry: makeWeatherRepository())
        return weatherUpdatesUseCase
    }
    private func makeWeatherRepository() -> WeatherRepository {
        let weatherRepository: WeatherRepository = FetchWeatherUpdateRepository(networkService: makeSearchNetworkService())
        return weatherRepository
    }
}
