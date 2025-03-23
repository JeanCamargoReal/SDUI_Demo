//
//  SingleBannerModel.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

// MARK: - Modelo do Componente

/// Modelo para o componente de Single Banner
struct SingleBannerModel: ComponentProtocol {
    let componentId: String
    let imageUrl: String
    let backgroundColor: String?
    let action: ComponentActionModel?

    var id: String { componentId }
}

