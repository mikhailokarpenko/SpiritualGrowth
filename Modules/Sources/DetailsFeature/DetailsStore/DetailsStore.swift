//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//

import Foundation
import Models
import ComposableArchitecture

public struct DetailsFeature: ReducerProtocol {
    //MARK: - State
    
    public struct State: Equatable {
        private let item: NewsModel

        public init(item: NewsModel) {
            self.item = item
        }

        var title: String {
            item.titleRendered.title.removeHTMLTags()
        }

        var imageUrl: URL? {
            item.featuredMedia.flatMap { URL(string: $0.fullSizeUrl) }
        }

        var date: String {
            item.date
        }

        var content: String {
            item.contentRendered.content.removeHTMLTags()
        }
    }

    //MARK: - Action

    public enum Action: Equatable {}

    //MARK: - Reducer

    public var body: some ReducerProtocol<State, Action> {
        EmptyReducer()
    }
}
