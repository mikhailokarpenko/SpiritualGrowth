//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import Models
import SwiftUI

//MARK: - View

public struct ListItem: SwiftUI.View {
    private let model: Self.Model
    
    public init(model: Self.Model) {
        self.model = model
    }
    
    public var body: some SwiftUI.View {
        HStack(spacing: 8) {
            AsyncImage(url: model.url) { image in
                image
            } placeholder: {
                Color.random
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)
            .clipped()
            .padding([.leading, .top, .bottom], 8)
            VStack(spacing: 8) {
                HStack(spacing: .zero) {
                    Text(model.title)
                        .lineLimit(2)
                        .font(.system(size: 15))
                    Spacer()
                }
                HStack(spacing: .zero) {
                    Text(model.description)
                        .lineLimit(3)
                        .font(.system(size: 11))
                    Spacer()
                }
            }
        }
    }
}

//MARK: - Model

public extension ListItem {
    struct Model {
        public let title, description: String
        public let url: URL?

        public init(item: NewsModel) {
            self.title = item.titleRendered.title.removeHTMLTags()
            self.description = item.contentRendered.content.removeHTMLTags()
            self.url = item.featuredMedia.flatMap { URL(string: $0.fullSizeUrl) }
        }

        static let mock: Self = .init(item: .mock)
    }
}

//MARK: - Previews

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(model: .mock)
    }
}
