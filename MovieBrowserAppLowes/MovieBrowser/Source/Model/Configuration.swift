//
//  Configuration.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/18/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

enum Sizes: String, Codable {
//    case width92 = "w92"
//    case width154 = "w154"
    case width185 = "w185"
//    case width342 = "w342"
//    case width500 = "w500"
//    case width780 = "w780"
//    case widthOritional = "original"
}

struct Configuration: Codable {

    enum RootKeys: String, CodingKey {
        case images
    }
    
    enum ImagesKeys: String, CodingKey {
        case baseUrl = "base_url"
        case secureBaseUrl = "secure_base_url"
        case posterSizes = "poster_sizes"
    }

    let baseUrl: String
    let secureBaseUrl: String
    var width: Sizes?
}

extension Configuration {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        let imagesContainer = try container.nestedContainer(keyedBy: ImagesKeys.self, forKey: .images)
        baseUrl = try imagesContainer.decode(String.self, forKey: .baseUrl)
        secureBaseUrl = try imagesContainer.decode(String.self, forKey: .secureBaseUrl)
        
        var reviewUnkeyedContainer = try imagesContainer.nestedUnkeyedContainer(forKey: .posterSizes)
        while !reviewUnkeyedContainer.isAtEnd {
            let value = try reviewUnkeyedContainer.decode(String.self)
            if let size = Sizes.init(rawValue: value) {
                width = size
            }
        }
    }

}
