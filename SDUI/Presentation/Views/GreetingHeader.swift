import SwiftUI

// MARK: - View do Componente
struct GreetingHeaderView: View {
    let model: GreetingHeaderModel
    
    var body: some View {
        HStack {
            // Saudação: "Olá, [nome]"
            // "Olá, " com a cor definida por greetingTextColor (padrão preto)
            // O nome com a cor definida por userNameColor (padrão verde escuro)
            Text(model.title)
                .foregroundColor(Color(hex: model.greetingTextColor ?? "#000000"))
                .fontWeight(.medium)
                .font(.system(size: 22))
            + Text(" " + model.subtitle)
                .foregroundColor(Color(hex: model.userNameColor ?? "#007556") ?? .green)
                .fontWeight(.medium)
                .font(.system(size: 22))
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}
