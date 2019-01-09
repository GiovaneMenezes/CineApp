//
//  SearchService.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 09/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol SearchServiceProtocol {
    func searchMovies(query: String, page: Int?) -> Single<SearchMoviesPage>
}

struct SearchService: SearchServiceProtocol {
    
    let provider = MoyaProvider<SearchAPI>(requestClosure: requestTimeoutClosure)
    
    func searchMovies(query: String, page: Int?) -> Single<SearchMoviesPage> {
        return provider.rx
            .request(.searchMovies(query: query, page: page))
            .retry(3)
            .filter(statusCode: 200)
            .map(SearchMoviesPage.self)
            .catchError { error in
                try self.handleError(error: error)
                return Observable.empty().asSingle()
        }
    }
    
    func handleError(error: Error) throws {
        guard let moyaError = error as? MoyaError else { throw error }
        
        switch moyaError {
        case .statusCode(let response):
            if response.statusCode == 401 {
                throw MoviesError.unauthorized
            } else {
                throw MoviesError.underlyingNewsError(error)
            }
        case .underlying(let error, _):
            throw MoviesError.underlyingNewsError(error)
        case .objectMapping(let error, _):
            throw MoviesError.objectMapping(error)
        default:
            throw error
        }
    }
}
