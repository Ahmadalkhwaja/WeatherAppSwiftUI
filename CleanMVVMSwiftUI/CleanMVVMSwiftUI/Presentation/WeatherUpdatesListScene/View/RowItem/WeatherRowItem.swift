//
//  WeatherRowItem.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 23/03/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct WeatherRowItem: View {
    var weatherForecastDay: Forecastday
    var body: some View {
        VStack(alignment: .leading) {
            Text(weatherForecastDay.date ?? "")
            HStack {
                WebImage(url: URL(string: weatherForecastDay.day?.condition?.securedIconURL ?? ""))
                    .placeholder {
                        ProgressView()
                    }
                    .frame(width: 30, height: 30, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(weatherForecastDay.day?.condition?.text ?? "")
                    .foregroundColor(.gray)
                Spacer()
                Text(String(format: "%.2f", weatherForecastDay.day?.maxtempC ?? 0.0))
                    .foregroundColor(.green)
            }
        }
    }
}

struct WeatherRowItem_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRowItem(weatherForecastDay: Forecastday())
    }
}
