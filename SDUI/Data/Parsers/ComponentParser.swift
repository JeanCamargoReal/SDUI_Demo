//
//  ComponentParser.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import Foundation

final class ComponentParser: ComponentParsingProtocol {
    private let registry: ComponentRegisteringProtocol

    init(registry: ComponentRegisteringProtocol = ComponentRegistry.shared) {
        self.registry = registry
    }

    func parse(from json: [String: Any]) -> Result<ParsedComponentEntity, Error> {
        guard let type = json["type"] as? String else {
            return .failure(ComponentError.missingType)
        }

        guard let id = json["id"] as? String else {
            return .failure(ComponentError.missingId)
        }

        guard let modelType = registry.modelType(for: type) else {
            return .failure(ComponentError.unregisteredComponent(type))
        }

        guard let properties = json["properties"] as? [String: Any] else {
            return .failure(ComponentError.missingProperties)
        }

        var mutableProperties = properties
        mutableProperties["componentId"] = id

        do {
            let data = try JSONSerialization.data(withJSONObject: mutableProperties)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            if let model = try decoder.decode(modelType, from: data) as? (any ComponentProtocol) {
                return .success(ParsedComponentEntity(componentType: type, model: model))
            } else {
                return .failure(ComponentError.invalidModelFormat)
            }
        } catch {
            return .failure(ComponentError.decodingError(error))
        }
    }
}
