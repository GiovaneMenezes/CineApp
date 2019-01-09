//
//  MoviesService.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 05/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol MoviesServiceProtocol {
    func fetchUpcomingMovies(page: Int?) -> Single<UpcomingMoviesPage>
}

let requestTimeoutClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        request.timeoutInterval = TimeInterval(10)
        done(.success(request))
    } catch {
        let error = MoyaError.underlying(error, nil)
        done(.failure(error))
    }
}

func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

struct MoviesService: MoviesServiceProtocol {
    
    let provider = MoyaProvider<MoviesAPI>(requestClosure: requestTimeoutClosure)
    
    func fetchUpcomingMovies(page: Int?) -> Single<UpcomingMoviesPage> {
        return provider.rx
            .request(.getUpcoming(page: page))
            .retry(3)
            .filter(statusCode: 200)
            .map(UpcomingMoviesPage.self)
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
