//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//

import SwiftUI
import AppFeature

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                store: .init(
                    initialState: .initial,
                    reducer: AppFeature()
                )
            )
        }
    }
}
