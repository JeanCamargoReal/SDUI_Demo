import SwiftUI

struct CategoryCarouselView: View {
    let model: CategoryCarouselModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(model.categories, id: \.name) { item in
                    VStack {
                        AsyncImage(url: URL(string: item.icon)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                        } placeholder: {
                            ProgressView()
                        }

                        Text(item.name)
                            .font(.caption)
                    }
                    .onTapGesture {
                        ActionHandler().handle(action: item.action)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
