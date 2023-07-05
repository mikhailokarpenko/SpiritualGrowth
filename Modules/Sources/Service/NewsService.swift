//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import Models
import Combine
import Foundation
import Networking

// MARK: - Service Contract

public protocol NewsServiceProtocol {
    func news(for page: Int) -> AnyPublisher<[NewsModel], NAError>
}

// MARK: - News Service

public final class NewsService {
    internal let jsonDecoder = JSONDecoder()
    private let network: NetworkProtocol

    public init(network: NetworkProtocol) {
        self.network = network
    }
}

// MARK: - Protocol Methods

extension NewsService: NewsServiceProtocol {
    public func news(for page: Int) -> AnyPublisher<[NewsModel], NAError> {
        network.request(endpoint: .news(page: page))
    }
}
