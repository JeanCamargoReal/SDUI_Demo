//
//  CategoryCarouselModel.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

struct CategoryCarouselModel: ComponentProtocol {
    let componentId: String
    let categories: [CategoryItem]
    
    var id: String { componentId }
}

struct CategoryItem: Decodable {
    let name: String
    let icon: String
    let action: ComponentActionModel
}
