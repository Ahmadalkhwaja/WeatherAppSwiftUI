//
//  SearchAutoCompleteAPI.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation
import Alamofire

enum SearchAutoCompleteAPI {
    case fetchSearchAutoComplete(query: RegionQuery)
}

extension SearchAutoCompleteAPI: APIRouter {
    var actionParameters: [String : Any] {
        switch self {
        case .fetchSearchAutoComplete(let request):
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
        case .fetchSearchAutoComplete:
            return .get
        }
    }
    var path: String {
        switch self {
        case .fetchSearchAutoComplete:
            return ""
        }
    }
    var baseURL: String {
        return "https://api.weatherapi.com/v1/search.json"
    }
}
