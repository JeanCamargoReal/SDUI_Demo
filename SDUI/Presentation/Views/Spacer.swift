import SwiftUI

// MARK: - Modelo do Componente Spacer

struct SpacerModel: ComponentModel {
    let componentId: String
    let verticalSpacing: CGFloat?  // Altura do espaço vertical (em pontos)
    
    var id: String { componentId }
}

// MARK: - View do Componente Spacer

struct SpacerView: View {
    let model: SpacerModel
    
    var body: some View {
        // Utiliza uma Color.clear para ocupar o espaço
        Color.clear
            .frame(height: model.verticalSpacing ?? 16)
    }
}

