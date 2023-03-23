//
//  ScenesFactory.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 23/03/2023.
//

import Foundation

final class ScenesFactory {
    class func makeWeatherUpdatesView() -> WeatherUpdatesView {
        return WeatherUpdatesConfigurator().configureWeatherUpdatesView()
    }
    class func makeWeatherUpdatesList(regionName: String) -> WeatherUpdatesListView {
        return WeatherUpdatesConfigurator().configureWeatherUpdatesListView(regionName: regionName)
    }
}
