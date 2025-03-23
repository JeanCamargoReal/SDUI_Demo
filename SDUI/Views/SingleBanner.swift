import SwiftUI

// MARK: - Modelo do Componente

/// Modelo para o componente de Single Banner
struct SingleBannerModel: ComponentModel {
    let componentId: String
    let imageUrl: String
    let backgroundColor: String?
    let action: ComponentActionModel?
    
    var id: String { componentId }
}

// MARK: - View do Componente

struct SingleBannerView: View {
    let model: SingleBannerModel
    @EnvironmentObject private var actionHandler: ActionHandler
    
    var body: some View {
        ZStack {
            // Fundo do banner
            if let bgHex = model.backgroundColor, let bgColor = Color(hex: bgHex) {
                bgColor
            } else {
                Color.clear
            }
            
            // Imagem do banner
            AsyncImage(url: URL(string: model.imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                } else if phase.error != nil {
                    Color.red.opacity(0.3)
                } else {
                    Color.gray.opacity(0.3)
                        .overlay(ProgressView())
                }
            }
        }
        .frame(height: 180) // Ajuste a altura conforme necessário
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
        .onTapGesture {
            if let action = model.action {
                actionHandler.handle(action: action)
            }
        }
    }
}

