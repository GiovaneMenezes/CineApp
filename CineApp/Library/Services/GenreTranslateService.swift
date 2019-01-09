//
//  GenreTranslateService.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 08/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class GenreTranslateService {
    
    static var shared = GenreTranslateService()
    
    var genreList: [Genre]?
    
    init() {  }
    
    func updateGenresList(genres: [Genre]) {
        self.genreList = genres
    }
    
    func translate(id: Int) -> String? {
        return genreList?.first { $0.id == id }?.name
    }
    
    func translate(ids: [Int]) -> [String] {
        return ids.compactMap { translate(id: $0) }
    }
    
    func formattedTranslate(to ids: [Int]) -> String {
        return translate(ids: ids).joined(separator: ", ")
    }
}
