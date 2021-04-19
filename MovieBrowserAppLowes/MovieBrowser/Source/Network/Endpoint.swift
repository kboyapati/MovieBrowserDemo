//
//  Endpoint.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/19/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

protocol EndPoint {
    var baseUrl: String { get }
    var path: String { get }
    var parameters: Parameters { get }
    var request: URLRequest? { get }
}

extension EndPoint {
    var path: String {
        return ""
    }
    
    var parameters: Parameters {
        Parameters()
    }
    
    var request: URLRequest? {
        var components = URLComponents(string: baseUrl + path)
        components?.queryItems = parameters.map({ URLQueryItem(name: $0.key, value: ($0.value as? String) ?? "") })
        if let queryUrl = components?.url {
            return URLRequest(url: queryUrl)
        }
        return nil
    }
}
