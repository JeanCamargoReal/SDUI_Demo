//
//  BannerCarouselModel.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

struct BannerCarouselModel: ComponentProtocol {
    let componentId: String
    let banners: [BannerItem]
    
    var id: String { componentId }
}

struct BannerItem: Decodable {
    let imageUrl: String
    let action: ComponentActionModel
}
