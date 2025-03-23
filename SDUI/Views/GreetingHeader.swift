import SwiftUI

// MARK: - Modelo do Componente
/// Recebe apenas o nome do usuário e as cores de texto como parâmetros
struct GreetingHeaderModel: ComponentModel {
    let componentId: String
    let userName: String
    let greetingTextColor: String?   // Cor do "Olá, " (padrão: "#000000")
    let userNameColor: String?         // Cor do nome (padrão: "#007556")
    
    var id: String { componentId }
}

// MARK: - View do Componente
struct GreetingHeaderView: View {
    let model: GreetingHeaderModel
    
    var body: some View {
        HStack {
            // Saudação: "Olá, [nome]"
            // "Olá, " com a cor definida por greetingTextColor (padrão preto)
            // O nome com a cor definida por userNameColor (padrão verde escuro)
            Text("Olá, ")
                .foregroundColor(Color(hex: model.greetingTextColor ?? "#000000"))
                .fontWeight(.medium)
                .font(.system(size: 22))
            + Text(model.userName)
                .foregroundColor(Color(hex: model.userNameColor ?? "#007556") ?? .green)
                .fontWeight(.medium)
                .font(.system(size: 22))
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}
