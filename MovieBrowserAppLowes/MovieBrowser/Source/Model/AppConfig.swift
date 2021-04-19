//
//  AppConfig.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/18/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class AppConfig {
    static var shared = AppConfig()
    
    var configuration: Configuration?
    
    private init() {
        
    }
    
    func fetchConfiguration() {
        let configEndpoint: MovieDBEndPoint = .configuration
        Network.request(of: Configuration.self, endPoint: configEndpoint) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let config):
                self.configuration = config
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
