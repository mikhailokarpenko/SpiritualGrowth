//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import Models
import Service
import Foundation
import Networking
import ComposableArchitecture

public struct ListFeature: ReducerProtocol {
    private let environment: ListEnvironment = .init(
        newsService: NewsService(
            network: Networking(
                session: .shared
            )
        )
    )

    //MARK: - State

    public struct State: Equatable {
        public var page: Int = 1
        public var items: [NewsModel]

        public init(items: [NewsModel]) {
            self.items = items
        }
    }

    //MARK: - Action
    public enum Action: Equatable {
        case start
        case didScrollToBottom
        case details(NewsModel)
        case onAppear(NewsModel)
        case loadedNews([NewsModel])
    }

    //MARK: - Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .start, .didScrollToBottom:
                return environment
                    .newsService
                    .news(for: state.page)
                    .replaceError(with: [])
                    .receive(on: DispatchQueue.main)
                    .map(Action.loadedNews)
                    .eraseToEffect()
            case .loadedNews(let items):
                state.page += 1
                state.items += items
                return .none
            case .details:
                return .none
            case .onAppear(let post):
                return post == state.items.last ?
                EffectTask(value: Action.didScrollToBottom) : .none
            }
        }
    }

    public init() {}
}
