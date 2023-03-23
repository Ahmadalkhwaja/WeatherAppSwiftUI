//
//  SearchRepository.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation

protocol SearchRepository {
    func fetchAutoCompleteResults(query: RegionQuery,
                                  completion: @escaping (Result<SearchAutoComplete, Error>) -> Void)
}
