//
//  HomeView.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

struct HomeView: View {
    @State private var components: [ParsedComponentEntity] = []
    private let service = ComponentService()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(components, id: \ .model.componentId) { component in
                        ComponentRegistry.shared.buildView(for: component)
                    }
                }.padding()
            }
            .navigationTitle("Início")
            .onAppear(perform: loadComponents)
        }
    }

    private func loadComponents() {
        guard let url = URL(string: "http://localhost:8000/sdui/publish") else { return }
        service.fetchComponents(from: url) { parsed in
            DispatchQueue.main.async {
                self.components = parsed
            }
        }
    }
}
