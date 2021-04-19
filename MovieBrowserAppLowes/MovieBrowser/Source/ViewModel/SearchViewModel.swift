//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/18/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewModel {
    
    private var dataSource: [MovieViewModel]?
    
    var rows: Int {
        return self.dataSource?.count ?? 0
    }
    
    var dataDidLoad: (()->Void)?
    
    func movieViewModel(at index: Int) -> MovieViewModel? {
        if index < self.rows {
            return self.dataSource?[index]
        }
        return nil
    }
    
    func search(query: String) {
        let endPoint: MovieDBEndPoint = .search(query: query)
        Network.request(of: SearchMovieResponse.self, endPoint: endPoint) { [weak self] result in
            
            switch result {
            case .success(let searchResponse):
                self?.dataSource = searchResponse.results?.map({ MovieViewModel(movie: $0) })
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            self?.dataDidLoad?()
        }
    }
}
