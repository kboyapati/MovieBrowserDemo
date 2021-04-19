//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class Network {
    class func request<T: Codable>(of type: T.Type, endPoint: EndPoint, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        if let request = endPoint.request {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let decodedInfo = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(.success(decodedInfo))
                    }
                    catch {
                        completionHandler(.failure(error))
                    }
                    
                }
                else {
                    completionHandler(.failure(error!))
                }
            }
            .resume()
        }
    }
}
