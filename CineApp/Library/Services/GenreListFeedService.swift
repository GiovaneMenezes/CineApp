//
//  GenreListFeedService.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 08/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import RxSwift
import Moya

typealias FetchGenresCompletion = () -> Void

struct GenreListFeedService {
    
    private let provider = MoyaProvider<GenresAPI>(requestClosure: requestTimeoutClosure)
    private let disposebag = DisposeBag()
    private let genreTranslateService: GenreTranslateService!
    
    init(genreTranslateService: GenreTranslateService = GenreTranslateService.shared) {
        self.genreTranslateService = genreTranslateService
    }
    
    func fetchGenres(onComplete: FetchGenresCompletion?) {
        provider.rx
            .request(.getGenres)
            .retry(3)
            .filter(statusCode: 200)
            .map(GenreList.self)
            .subscribe { result in
                switch result {
                case .success(let genreList):
                    self.handleResponse(genres: genreList.genres, handler: onComplete)
                case .error:
                    self.handleResponse(genres: [], handler: onComplete)
                }
            }.disposed(by: disposebag)
    }
    
    private func handleResponse(genres: [Genre], handler: FetchGenresCompletion?) {
        genreTranslateService.updateGenresList(genres: genres)
        handler?()
    }
    
}
