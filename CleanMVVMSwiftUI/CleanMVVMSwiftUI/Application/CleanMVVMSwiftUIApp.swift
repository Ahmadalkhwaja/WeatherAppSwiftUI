//
//  CleanMVVMSwiftUIApp.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import SwiftUI

@main
struct CleanMVVMSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ScenesFactory.makeWeatherUpdatesView()
        }
    }
}
