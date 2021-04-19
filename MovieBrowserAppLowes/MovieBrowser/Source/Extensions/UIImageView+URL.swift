//
//  UIImageView+URL.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/18/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL, placeholder: UIImage, completion: ((UIImage?)->Void)?) {
        self.image = placeholder
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
                completion?(image)
            }
            else {
                completion?(nil)
            }
        })
            .resume()
    }
}
