
/// View para o carrossel de banners
import SwiftUI

struct BannerCarouselView: View {
    let model: BannerCarouselModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(model.banners.indices, id: \.self) { index in
                    let banner = model.banners[index]

                    AsyncImage(url: URL(string: banner.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(width: 300, height: 150)
                    .cornerRadius(12)
                    .onTapGesture {
                        ActionHandler().handle(action: banner.action)
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 160)
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
