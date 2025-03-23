import SwiftUI

// MARK: - Modelo do Componente
struct BalanceCardModel: ComponentModel {
    let componentId: String
    let iconUrl: String?          // URL do ícone no círculo
    let backgroundColor: String?  // Cor de fundo do círculo (ex.: "#007556")
    let title: String             // Título (ex.: "Refeição")
    let balance: String           // Saldo (ex.: "R$ 200,00")
    let action: ComponentActionModel?
    
    var id: String { componentId }
}

// MARK: - View do Componente
struct BalanceCardView: View {
    let model: BalanceCardModel
    @EnvironmentObject private var actionHandler: ActionHandler
    
    var body: some View {
        HStack(spacing: 16) {
            // Ícone com fundo circular
            ZStack {
                Circle()
                    .fill(Color(hex: model.backgroundColor ?? "") ?? Color.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                // Exibe o ícone a partir da URL (caso exista)
                if let iconUrl = model.iconUrl, let url = URL(string: iconUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 20, height: 20)
                } else {
                    Image(systemName: "questionmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
            }

            
            // Título e saldo
            VStack(alignment: .leading, spacing: 4) {
                Text(model.title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(model.balance)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            // Ícone de navegação (seta)
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
        // Borda de 1px cinza
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .padding(.horizontal)
        .onTapGesture {
            // Executa a ação se houver
            if let action = model.action {
                actionHandler.handle(action: action)
            }
        }
    }
}
