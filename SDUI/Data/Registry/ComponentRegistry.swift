//
//  ComponentRegistry.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

final class ComponentRegistry: ComponentRegisteringProtocol {
    static let shared = ComponentRegistry()

    private var factories: [String: (Any) -> AnyView] = [:]
    private var models: [String: Decodable.Type] = [:]

    private init() {}

    func register<T: ComponentProtocol>(componentType: String, modelType: T.Type, viewBuilder: @escaping (T) -> AnyView) {
        factories[componentType] = { data in
            guard let model = data as? T else {
                return AnyView(Text("Erro: Tipo incorreto para \(componentType)").foregroundColor(.red))
            }
            return viewBuilder(model)
        }
        models[componentType] = modelType
    }

    func modelType(for componentType: String) -> Decodable.Type? {
        models[componentType]
    }

    func buildView(for parsed: ParsedComponentEntity) -> AnyView {
        factories[parsed.componentType]?(parsed.model) ??
            AnyView(Text("Componente não registrado: \(parsed.componentType)").foregroundColor(.red))
    }
}
