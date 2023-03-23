//
//  FetchSearchAutoCompleteRepository.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation

class FetchSearchAutoCompleteRepository {
    let networkService: NetworkManagerProtocol
    init(networkService: NetworkManagerProtocol) {
        // caching storage service can be injected here.
        self.networkService = networkService
    }
}
extension FetchSearchAutoCompleteRepository: SearchRepository {
    func fetchAutoCompleteResults(query: RegionQuery, completion: @escaping (Result<SearchAutoComplete, Error>) -> Void) {
        let apiEndpoint = APIEndpoints.fetchSearchAutoComplete(query: query)
        networkService.request(router: apiEndpoint, completionBlock: { response in
            switch response.result {
            case let .success(data):
                let decoder = JSONDecoder.init()
                let results = (try? decoder.decode(SearchAutoComplete.self, from: data)) ?? []
                completion(.success(results))
            case let .failure(error):
                completion(.failure(error))
                break
            }
        })
    }
}
