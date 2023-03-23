//
//  SearchUseCase.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 22/03/2023.
//

import Foundation

protocol SearchUseCase {
    func execute(
        requestValue: SearchUseCaseRequestValue,
        completion: @escaping (Result<SearchAutoComplete, Error>) -> Void
    )
}

final class SearchUseCaseImpl: SearchUseCase {
    private let searchRepository: SearchRepository
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }
    
    func execute(requestValue: SearchUseCaseRequestValue, completion: @escaping (Result<SearchAutoComplete, Error>) -> Void) {
        searchRepository.fetchAutoCompleteResults(query: requestValue.query, completion: { result in
            completion(result)
        })
    }
}

struct SearchUseCaseRequestValue {
    let query: RegionQuery
}
