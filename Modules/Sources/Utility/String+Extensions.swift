//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import Foundation

public extension String {
    func removeHTMLTags() -> String {
        replacingOccurrences(
            of: "<[^>]+>",
            with: String(),
            options: .regularExpression,
            range: nil
        )
    }
}
