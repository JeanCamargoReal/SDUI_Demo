//
//  ActionHandler.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

// MARK: - Gerenciador de Ações

/// Gerenciador centralizado para lidar com ações de componentes
final class ActionHandler: ObservableObject {
    typealias ActionCallback = (any ComponentProtocol) -> Void
    
    /// Armazena callbacks para diferentes tipos de ações
    private var actionHandlers: [String: ActionCallback] = [:]
    
    /// Registra um callback para um tipo específico de ação
    func register(forType actionType: String, handler: @escaping ActionCallback) {
        actionHandlers[actionType] = handler
    }
    
    /// Processa uma ação usando o callback apropriado
    func handle(action: ComponentActionProtocol) {
        if let handler = actionHandlers[action.actionType] {
            handler(action as! (any ComponentProtocol))
        } else {
            print("Nenhum handler registrado para ação: \(action.actionType)")
        }
    }
}
