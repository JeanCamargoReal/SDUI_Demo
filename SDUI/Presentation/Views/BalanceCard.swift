import SwiftUI

// MARK: - View do Componente
import SwiftUI

struct BalanceCardView: View {
    let model: BalanceCardModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Saldo disponível")
                .font(.caption)
                .foregroundColor(.secondary)

            Text(model.balance.formatted(.currency(code: model.currency)))
                .font(.title)
                .bold()
                .foregroundColor(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}
