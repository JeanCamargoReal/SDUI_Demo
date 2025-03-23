import SwiftUI

// MARK: - View do Componente Spacer

struct SpacerView: View {
    let model: SpacerModel
    
    var body: some View {
        // Utiliza uma Color.clear para ocupar o espaço
        Color.clear
            .frame(height: model.verticalSpacing)
    }
}

