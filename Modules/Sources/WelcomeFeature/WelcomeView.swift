//
// Copyright © 2023 Michael Karpenko. All rights reserved.
// 

import SwiftUI
import UIComponents
import ComposableArchitecture

public struct WelcomeView: View {
    private let store: StoreOf<WelcomeFeature>
    
    public init(store: StoreOf<WelcomeFeature>) {
        self.store = store
    }
    
    @ViewBuilder
    private var background: some View {
        FlowingColorView().edgesIgnoringSafeArea(.all)
    }
    
    @ViewBuilder
    private var logo: some View {
        Image("welcome_logo", bundle: Bundle.module)
            .resizable()
            .scaledToFit()
    }

    @ViewBuilder
    private var appeal: some View {
        Image("make_social_real", bundle: Bundle.module)
            .resizable()
            .scaledToFit()
            .frame(height: 70)
    }

    @ViewBuilder
    private var button: some View {
        WithViewStore(store) { viewStore in
            Button {
              viewStore.send(.enter)
            } label: {
                VStack {
                    Spacer().frame(height: 500)
                    Text("Enter")
                    Spacer()
                }
            }
        }
    }
    
    public var body: some View {
        ZStack {
            background
            logo
            appeal
            button
        }
    }
}
