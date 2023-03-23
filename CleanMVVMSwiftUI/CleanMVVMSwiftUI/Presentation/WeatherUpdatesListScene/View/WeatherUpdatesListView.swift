//
//  WeatherUpdatesListView.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 23/03/2023.
//

import SwiftUI

struct WeatherUpdatesListView: View {
    @StateObject var viewModel: WeatherUpdatesListViewModel
    
    var body: some View {
        List(viewModel.forecastdays) { item in
            WeatherRowItem(weatherForecastDay: item)
        }
    }
}

struct WeatherUpdatesListView_Previews: PreviewProvider {
    static var previews: some View {
        // object will be accessed by previewer only
        WeatherUpdatesListView(viewModel: WeatherUpdatesConfigurator().makeWeatherUpdatesListViewModel(regionName: ""))
    }
}
