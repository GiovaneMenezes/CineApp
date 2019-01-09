//
//  UpcomingMoviesAPI.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 05/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation
import Moya

enum MoviesAPI {
    case getUpcoming(page: Int?)
}

extension MoviesAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .getUpcoming:
            return "/movie/upcoming"
        }
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

extension MoviesAPI {
    var requestParameters: [String : Any] {
        var parameters: [String : Any] = [:]
        switch self {
        case .getUpcoming(let page):
            if let page = page {
                parameters["page"] = page
            }
        }
        parameters["api_key"] = APICredentials.key
        return parameters
    }
}


