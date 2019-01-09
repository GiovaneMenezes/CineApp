//
//  APICredentials.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 05/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Foundation

struct APICredentials {
    static var key: String {
        guard let path = Bundle.main.path(forResource: "TheMovieDBApiKey", ofType: "plist"), let nsDictionary = NSDictionary(contentsOfFile: path), let apiKey = nsDictionary["api_key"] as? String else { fatalError("TheMovieDBApiKey.plist should contains the property api_key") }
        return apiKey
    }
}
