//
//  GenresAPI.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 08/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import Moya

enum GenresAPI {
    case getGenres
}

extension GenresAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .getGenres:
            return "/genre/movie/list"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["api_key":APICredentials.key], encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}

extension GenresAPI {
    
}
