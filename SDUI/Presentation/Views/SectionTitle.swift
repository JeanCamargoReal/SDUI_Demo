
import SwiftUI

struct SectionTitleView: View {
    let model: SectionTitleModel
    @EnvironmentObject private var actionHandler: ActionHandler
    
    var body: some View {
        HStack {
            // Título à esquerda
            Text(model.title)
                .foregroundColor(.black)
                .fontWeight(.medium)
                .font(.system(size: 22))
            
            Spacer()
            
            // Botão opcional à direita
            if let actionTitle = model.actionTitle,
               let action = model.action {
                Button(action: {
                    actionHandler.handle(action: action)
                }) {
                    Text(actionTitle)
                        .foregroundColor(Color(hex: "#007556") ?? .green)
                        .fontWeight(.medium)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
