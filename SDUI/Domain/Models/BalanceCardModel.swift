//
//  BalanceCardModel.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

// MARK: - Modelo do Componente
struct BalanceCardModel: ComponentProtocol {
    let componentId: String
    let balance: Double
    let currency: String

    var id: String { componentId }
}
