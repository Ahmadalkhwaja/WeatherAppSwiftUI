//
//  FetchWeatherAPI.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation
import Alamofire

enum FetchWeatherAPI {
    case getWeatherUpdates(query: RegionQuery)
}

extension FetchWeatherAPI: APIRouter {
    var actionParameters: [String : Any] {
        switch self {
        case .getWeatherUpdates(let request):
            return ["key":"dcc6d025aeeb40cb8b1221817232103",
                    "q":"\(request.query)",
                    "days":"5",
                    "aqi":"no",
                    "alerts":"no"]
        }
    }
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    var authHeader: HTTPHeaders? {
        return [:]
    }
    var method: HTTPMethod {
        switch self {
        case .getWeatherUpdates:
            return .get
        }
    }
    var path: String {
        switch self {
        case .getWeatherUpdates:
            return ""
        }
    }
    var baseURL: String {
        return "https://api.weatherapi.com/v1/forecast.json"
    }
}
