//
//  SectionTitleModel.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

/// Modelo para o título de seção
struct SectionTitleModel: ComponentProtocol {
    let componentId: String
    let title: String
    let actionTitle: String?
    let action: ComponentActionModel?

    var id: String { componentId }
}
