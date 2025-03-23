import SwiftUI

/// Modelo para o item de categoria
struct CategoryTileModel: Decodable, Identifiable {
    let tileId: String
    
    // URL do ícone (se for imagem remota)
    let iconUrl: String?
    
    // Cor de fundo opcional (em hex)
    let backgroundColor: String?
    
    // Texto exibido abaixo do bloco
    let label: ComponentText
    
    // Ação opcional ao clicar
    let action: ComponentActionModel?
    
    var id: String { tileId }
}

/// Modelo para o carousel de categorias
struct CategoryCarouselModel: ComponentModel {
    let componentId: String
    let title: String
    let showTitle: Bool
    let itemSpacing: CGFloat?
    let iconSize: CGFloat?       // Novo: tamanho do ícone (aplica a todos os itens)
    let items: [CategoryTileModel]
    
    var id: String { componentId }
}

/// View para o carousel de categorias
struct CategoryCarouselView: View {
    let model: CategoryCarouselModel
    @EnvironmentObject private var actionHandler: ActionHandler
    
    // Valor padrão para o tamanho do ícone se não definido
    private var defaultIconSize: CGFloat { 20 }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if model.showTitle {
                Text(model.title)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .font(.system(size: 22))
                    .padding(.horizontal)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: model.itemSpacing ?? 8) {
                    ForEach(model.items) { item in
                        categoryTileView(for: item)
                            .onTapGesture {
                                if let action = item.action {
                                    actionHandler.handle(action: action)
                                }
                            }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
        }
    }
    
    private func categoryTileView(for item: CategoryTileModel) -> some View {
        VStack(spacing: 16) {
            ZStack {
                // Fundo arredondado
                if let hexColor = item.backgroundColor,
                   let bgColor = Color(hex: hexColor) {
                    bgColor
                } else {
                    Color.gray.opacity(0.1)
                }
                
                // Ícone central, utilizando iconSize do carrossel ou valor padrão
                if let iconUrl = item.iconUrl, let url = URL(string: iconUrl) {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image(systemName: "questionmark")
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(width: model.iconSize ?? defaultIconSize, height: model.iconSize ?? defaultIconSize)
                } else {
                    Image(systemName: "bag.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: model.iconSize ?? defaultIconSize, height: model.iconSize ?? defaultIconSize)
                }
            }
            // Largura e altura do tile (pode ser configurado, se necessário, via outras propriedades)
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            // Título abaixo do tile
            Text(item.label.content)
                .font(item.label.toSwiftUIFont())
                .foregroundColor(item.label.toSwiftUIColor())
                .lineLimit(item.label.maxLines)
                .multilineTextAlignment(.center)
                .frame(width: 100)
        }
        .contentShape(Rectangle())
    }
}
