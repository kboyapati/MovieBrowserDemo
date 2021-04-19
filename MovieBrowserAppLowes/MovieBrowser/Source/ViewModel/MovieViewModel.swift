//
//  MovieViewModel.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/18/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieViewModel {
    
    private var movie: Movie
    
    var title: String {
        return movie.originalTitle ?? ""
    }
    
    var releaseData: String {
        return movie.releaseDate?.date(from: "yyyy-MM-dd", toFormat: "MMMM d, yyyy") ?? ""
    }
    
    var ratting: String {
        guard let average = movie.voteAverage else {
            return ""
        }
        return String(average)
    }
    
    var overview: String {
        return movie.overview ?? ""
    }
    
    var imageUrl: URL? {
        guard let configuration = AppConfig.shared.configuration else { return nil }
        let urlString = configuration.secureBaseUrl + (configuration.width ?? Sizes.width185).rawValue + (movie.posterPath ?? "")
        return URL(string: urlString)
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}
