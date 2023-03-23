//
//  SearchAutoComplete.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation

// MARK: - SearchAutoCompleteElement
public struct SearchAutoCompleteElement: Codable, Identifiable {
    public typealias Identifier = Int
    public let id: Identifier?
    public let name, region, country: String?
    public let lat, lon: Double?
    public let url: String?
}
public typealias SearchAutoComplete = [SearchAutoCompleteElement]
