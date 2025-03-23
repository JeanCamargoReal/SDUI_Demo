//
//  ComponentError.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import Foundation

enum ComponentError: Error, LocalizedError {
    case missingType, missingId, missingProperties
    case unregisteredComponent(String)
    case invalidModelFormat
    case decodingError(Error)

    var errorDescription: String? {
        switch self {
        case .missingType: return "Tipo de componente ausente"
        case .missingId: return "ID de componente ausente"
        case .missingProperties: return "Propriedades do componente ausentes"
        case .unregisteredComponent(let type): return "Componente não registrado: \(type)"
        case .invalidModelFormat: return "Formato de modelo inválido"
        case .decodingError(let error): return "Erro ao decodificar: \(error.localizedDescription)"
        }
    }
}
