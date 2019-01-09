//
//  SearchMoviesWorker.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 09/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import RxSwift

struct SearchMoviesWorker {
    let searchService: SearchServiceProtocol!
    
    init(searchService: SearchServiceProtocol = SearchService()) {
        self.searchService = searchService
    }
    
    func searchMovies(query: String, page: Int?) -> Single<SearchMoviesPage> {
        return searchService.searchMovies(query: query, page: page)
    }
}
