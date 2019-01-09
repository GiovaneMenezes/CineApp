//
//  MoviesError.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 05/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation

enum MoviesError {
    case lastPageReached
    case unauthorized
    case underlyingNewsError(Error)
    case objectMapping(Error)
    case unknown
}

extension MoviesError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .lastPageReached:
            return "Last movie reached."
        case .unauthorized:
            return "Unauthorized, unavailable data"
        case .underlyingNewsError(let error):
            return "An error occurred. Try again later \n\(error.localizedDescription)"
        case .objectMapping(let error):
            return "Something odd occurred. Try again later \n\(error.localizedDescription)"
        case .unknown:
            return "Unknowed error."
        }
    }
}
