//
//  WeatherUpdatesViewModel.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 23/03/2023.
//

import Foundation
import Combine

class WeatherUpdatesViewModel: ObservableObject {
    @Published var results = [SearchAutoCompleteElement]()
    @Published var searchText: String = "Amman"
    
    private var cancellables: Set<AnyCancellable> = []
    private let searchUseCase: SearchUseCase
    
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
        $searchText
            .sink { [weak self] text in
                self?.load(searchText: text)
            }.store(in: &cancellables)
    }
    func load(searchText: String) {
        let searchRequestValue = SearchUseCaseRequestValue(query: RegionQuery(query: searchText))
        searchUseCase.execute(requestValue: searchRequestValue, completion: { result in
            switch result {
            case .success(let data):
                self.results = data
            case .failure(_):
                break
            }
        })
    }
}
