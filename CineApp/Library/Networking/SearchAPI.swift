//
//  SearchAPI.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 08/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import Moya

enum SearchAPI {
    case searchMovies(query: String, page: Int?)
}

extension SearchAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        return "/search/movie"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: requestParameters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}

extension SearchAPI {
    var requestParameters: [String : Any] {
        var parameters: [String : Any] = [:]
        switch self {
        case .searchMovies(let query, let page):
            if let page = page {
                parameters["page"] = page
            }
            parameters["query"] = query
        }
        parameters["api_key"] = APICredentials.key
        return parameters
    }
}
