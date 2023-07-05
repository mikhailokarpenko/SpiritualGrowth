//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import SwiftUI
import WelcomeFeature
import ListFeature
import DetailsFeature
import ComposableArchitecture

public struct AppFeature: ReducerProtocol {

    public struct State: Equatable {
        public enum Route: Hashable {
            case list
            case details
        }
        
        var path: [Route] = []
        var welcomeState: WelcomeFeature.State
        var listState: ListFeature.State
        var detailsState: DetailsFeature.State
        public static let initial: Self = .init(
            path: [],
            welcomeState: .init(),
            listState: .init(items: []),
            detailsState: .init(item: .mock)
        )
    }
    
    public enum Action: Equatable {
        case welcome(WelcomeFeature.Action)
        case list(ListFeature.Action)
        case details(DetailsFeature.Action)
        case path([State.Route])
    }
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .welcome:
                state.welcomeState = .init()
                state.listState = .init(items: [])
                state.path = [.list]
                return .none
            case let .list(.details(item)):
                state.detailsState = .init(item: item)
                state.path = [.details]
                return .none
            case .path(let newPath):
                state.path = newPath
                return .none
            default:
                return .none
            }
        }
        Scope(
            state: \.welcomeState,
            action: /Action.welcome
        ) {
            WelcomeFeature()
        }
        Scope(
            state: \.listState,
            action: /Action.list
        ) {
            ListFeature()
        }
    }
    
    public init() {}
}
