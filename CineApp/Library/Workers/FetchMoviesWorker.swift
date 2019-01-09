//
//  FetchMoviesWorkers.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 05/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import RxSwift

struct FetchMoviesWorker {
    
    let moviesService: MoviesServiceProtocol!
    
    init(moviesService: MoviesServiceProtocol = MoviesService()) {
        self.moviesService = moviesService
    }
    
    func fetchMovies(page: Int?) -> Single<UpcomingMoviesPage> {
        return moviesService.fetchUpcomingMovies(page: page)
    }
}
