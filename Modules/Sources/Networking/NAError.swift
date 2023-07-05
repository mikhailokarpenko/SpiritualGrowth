//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


import Foundation

fileprivate struct Constants {
    static let badUrl = "Sorry, this URL is not valid"
    static let mapping = "Error raised, while mapping data"
    static let generic = "Sorry, try again later"
}

public enum NAError {
    case badUrl
    case mapping
    case generic
}

extension NAError: Error {
    public var localizedDescription: String {
        switch self {
        case .badUrl:
            return Constants.badUrl
        case .mapping:
            return Constants.mapping
        case .generic:
            return Constants.generic
        }
    }
}
