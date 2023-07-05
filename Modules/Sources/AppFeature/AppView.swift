//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import SwiftUI
import WelcomeFeature
import ListFeature
import DetailsFeature
import ComposableArchitecture

public struct AppView: View {
    let store: StoreOf<AppFeature>
    
    public var body: some View {
        WithViewStore.init(self.store) { viewStore in
            NavigationStack(
                path: viewStore.binding(
                    get: \.path,
                    send: .path([])
                )
            ) {
                WelcomeView(
                    store: store.scope(
                        state: \.welcomeState,
                        action: AppFeature.Action.welcome
                    )
                )
                .navigationDestination(for: AppFeature.State.Route.self) { route in
                    switch route {
                    case .list:
                        ListView(
                            store: store.scope(
                                state: \.listState,
                                action: AppFeature.Action.list
                            )
                        )
                        .onAppear {
                            viewStore.start()
                        }
                    case .details:
                        DetailsPage(
                            store: store.scope(
                                state: \.detailsState,
                                action: AppFeature.Action.details
                            )
                        )
                    }
                }
            }
        }
    }

    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }
}

fileprivate extension ViewStore<AppFeature.State, AppFeature.Action> {
    func start() {
        send(.list(.start))
    }
}
