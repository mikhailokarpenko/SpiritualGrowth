//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//

import SwiftUI

public struct FlowingColorView: View {
    @State private var hueRotation: Angle = .zero
    @State private var timer: Timer?
    
    public var body: some View {
        Image("background_login", bundle: Bundle.module)
            .resizable()
            .foregroundColor(.yellow)
            .hueRotation(hueRotation)
            .onAppear {
                startAnimating()
            }
            .onDisappear {
                stopAnimating()
            }
    }

    private func startAnimating() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            withAnimation {
                hueRotation += .degrees(5)
            }
        }
    }
    
    private func stopAnimating() {
        timer?.invalidate()
        timer = nil
    }
    
    public init() {}
}

struct FlowingColorView_Previews: PreviewProvider {
    static var previews: some View {
        FlowingColorView().edgesIgnoringSafeArea(.all)
    }
}
