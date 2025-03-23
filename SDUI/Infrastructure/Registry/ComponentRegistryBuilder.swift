//
//  ComponentRegistryBuilder.swift
//  SDUI
//
//  Created by Jean Camargo on 22/03/25.
//

import SwiftUI

final class ComponentRegistryBuilder {
    static func registerAll(registry: ComponentRegisteringProtocol = ComponentRegistry.shared) {
        registry.register(componentType: "greeting_header", modelType: GreetingHeaderModel.self) { model in
            AnyView(GreetingHeaderView(model: model))
        }

        registry.register(componentType: "section_title", modelType: SectionTitleModel.self) { model in
            AnyView(SectionTitleView(model: model))
        }

        registry.register(componentType: "banner_carousel", modelType: BannerCarouselModel.self) { model in
            AnyView(BannerCarouselView(model: model))
        }

        registry.register(componentType: "category_carousel", modelType: CategoryCarouselModel.self) { model in
            AnyView(CategoryCarouselView(model: model))
        }

        registry.register(componentType: "balance_card", modelType: BalanceCardModel.self) { model in
            AnyView(BalanceCardView(model: model))
        }

        registry.register(componentType: "single_banner", modelType: SingleBannerModel.self) { model in
            AnyView(SingleBannerView(model: model))
        }

        registry.register(componentType: "spacer", modelType: SpacerModel.self) { model in
            AnyView(SpacerView(model: model))
        }
    }
}
