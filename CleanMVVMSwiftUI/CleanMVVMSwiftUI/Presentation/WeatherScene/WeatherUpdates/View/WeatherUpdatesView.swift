//
//  WeatherUpdatesView.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 23/03/2023.
//

import SwiftUI

struct WeatherUpdatesView: View {
    @StateObject var viewModel: WeatherUpdatesViewModel
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .padding(.top, 10)
                List(viewModel.results) { item in
                    NavigationLink {
                        ScenesFactory.makeWeatherUpdatesList(regionName: item.name!)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(item.name!)
                                .font(.headline)
                            Text(item.region!)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationBarTitle("Weather App")
        }
    }
}

struct WeatherUpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        // object will be accessed by previewer only
        WeatherUpdatesView(viewModel: WeatherUpdatesConfigurator().makeWeatherUpdatesViewModel())
    }
}
