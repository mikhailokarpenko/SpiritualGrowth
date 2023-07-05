//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct WelcomeFeature: ReducerProtocol {
    //MARK: - State
    
    public struct State: Equatable {
        public init() {}
    }

    //MARK: - Action

    public enum Action: Equatable {
        case enter
    }

    //MARK: - Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .enter:
                return .none
            }
        }
    }
    
    public init() {}
}
