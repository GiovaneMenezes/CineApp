//
//  SearchMoviesPage.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 09/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation

struct SearchMoviesPage: Codable {
    let results: [MovieResult]?
    let page, totalResults: Int?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
