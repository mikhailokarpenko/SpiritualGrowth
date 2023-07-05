//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import Service

public struct ListEnvironment {
    public let newsService: NewsServiceProtocol

    public init(newsService: NewsServiceProtocol) {
        self.newsService = newsService
    }
}
