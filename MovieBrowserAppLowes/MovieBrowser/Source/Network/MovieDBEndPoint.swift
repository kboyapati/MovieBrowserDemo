//
//  ConfigurationEndPoint.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/17/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

enum MovieDBEndPoint: EndPoint {
    
    static private let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    
    case configuration
    case search(query: String)
    
    var baseUrl: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var path: String {
        switch self {
        case .configuration:
            return "configuration"
        case .search:
            return "search/movie"
        }
    }
    
    var parameters: Parameters {
        var params = Parameters()
        params["api_key"] = MovieDBEndPoint.apiKey
        
        switch self {
        case .search(let query):
            params["query"] = query
        default:
            break
        }
        return params
    }
    
}
