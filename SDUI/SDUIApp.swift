//
//  SDUIApp.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

@main
struct SDUIApp: App {
    init() {
        ComponentRegistryBuilder.registerAll()
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
