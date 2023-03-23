//
//  WeatherUpdateModel.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation


// MARK: - WeatherUpdateModel
public struct WeatherUpdateModel: Codable {
    public let location: Location?
    public let forecast: Forecast?
}
// MARK: - Forecast
public struct Forecast: Codable {
    public let forecastday: [Forecastday]?
}

// MARK: - Forecastday
public struct Forecastday: Codable, Identifiable {
    public typealias Identifier = String
    public var id: Identifier {
        return date ?? ""
    }
    public let date: String?
    public let dateEpoch: Int?
    public let day: Day?
    public let astro: Astro?
    public let hour: [Hour]?
    public init(date: String? = nil, dateEpoch: Int? = nil, day: Day? = nil, astro: Astro? = nil, hour: [Hour]? = nil) {
        self.date = date
        self.dateEpoch = dateEpoch
        self.day = day
        self.astro = astro
        self.hour = hour
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}
// MARK: - Astro
public struct Astro: Codable {
    public let isMoonUp, isSunUp: Int?

    enum CodingKeys: String, CodingKey {
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}
// MARK: - Day
public struct Day: Codable {
    public let maxtempC, mintempC: Double?
    public let totalsnowCM: Double?
    public let condition: DayCondition?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case totalsnowCM = "totalsnow_cm"
        case condition
    }
}
// MARK: - DayCondition
public struct DayCondition: Codable {
    public let text: String?
    public let icon: String?
    
    public var securedIconURL: String {
        return "https://" + String(icon?.dropFirst(2) ?? "")
    }
    public init(text: String?, icon: String?) {
        self.text = text
        self.icon = icon
    }
}
// MARK: - Hour
public struct Hour: Codable {
    public let tempC: Double?
    public let isDay: Int?
    public let condition: DayCondition?
    public let windDegree, humidity, cloud: Int?

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case windDegree = "wind_degree"
        case humidity, cloud
    }
}
// MARK: - Location
public struct Location: Codable {
    public let name, region, country: String?
    public let lat, lon: Double?
    public let tzID: String?
    public let localtimeEpoch: Int?
    public let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
