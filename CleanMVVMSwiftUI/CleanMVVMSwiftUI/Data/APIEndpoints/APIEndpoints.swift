//
//  APIEndpoints.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation

struct APIEndpoints {
    static func getWeatherUpdates(query: RegionQuery) -> APIRouter {
        let endpoint = FetchWeatherAPI.getWeatherUpdates(query: query)
        return endpoint
    }
    static func fetchSearchAutoComplete(query: RegionQuery) -> APIRouter {
        let endpoint = SearchAutoCompleteAPI.fetchSearchAutoComplete(query: query)
        return endpoint
    }
}
