//
//  SpacerModel.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

// MARK: - Modelo do Componente Spacer

struct SpacerModel: ComponentProtocol {
    let componentId: String
    let verticalSpacing: CGFloat?  // Altura do espaço vertical (em pontos)

    var id: String { componentId }
}
