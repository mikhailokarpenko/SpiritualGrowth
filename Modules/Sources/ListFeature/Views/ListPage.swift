//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import SwiftUI
import Combine
import ComposableArchitecture

//MARK: - View

public struct ListView: View {
    private let store: StoreOf<ListFeature>
    
    public init(store: StoreOf<ListFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            List(viewStore.items, id: \.id) { item in
                ListItem(model: .init(item: item))
                    .onTapGesture { viewStore.send(.details(item)) }
                    .onAppear { viewStore.send(.onAppear(item)) }
            }
        }
    }
}
