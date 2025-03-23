import SwiftUI

/// Modelo para o carrossel de banners
struct BannerCarouselModel: ComponentModel {
    let componentId: String
    let banners: [BannerModel]
    
    var id: String { componentId }
}

/// Modelo individual de banner
struct BannerModel: Decodable, Identifiable {
    let bannerId: String
    let imageUrl: String
    let action: ComponentActionModel?
    
    var id: String { bannerId }
}

/// View para o carrossel de banners
struct BannerCarouselView: View {
    let model: BannerCarouselModel
    @EnvironmentObject private var actionHandler: ActionHandler
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 8) { // Adiciona um espaçamento entre o banner e os indicadores
            TabView(selection: $currentIndex) {
                ForEach(model.banners.indices, id: \.self) { index in
                    bannerView(for: model.banners[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Oculta o indicador nativo

            // Indicadores personalizados
            HStack(spacing: 8) {
                ForEach(model.banners.indices, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color(hex: "#007556") ?? .green : Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
        }
        .frame(height: 200) // Ajustado para incluir os indicadores
    }
    
    private func bannerView(for banner: BannerModel) -> some View {
        ZStack {
            
            Color.clear
            

            GeometryReader { geometry in
                AsyncImage(url: URL(string: banner.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill() // Preenche o espaço sem distorcer
                            .frame(width: geometry.size.width, height: geometry.size.height) // Usa o tamanho do ZStack
                            .clipped() // Corta o excesso para não ultrapassar os limites
                    } else if phase.error != nil {
                        Color.red.opacity(0.3) // Cor de fallback caso ocorra erro
                    } else {
                        Color.gray.opacity(0.3)
                            .overlay(ProgressView())
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 180) // Define um tamanho consistente para o banner
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onTapGesture {
            if let action = banner.action {
                actionHandler.handle(action: action)
            }
        }
        .padding(.horizontal, 20) // Adiciona espaçamento lateral sem expandir a imagem
    }
}

// MARK: - Extensão Utilitária para Cores

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        self.init(
            .sRGB,
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0,
            opacity: 1.0
        )
    }
}
