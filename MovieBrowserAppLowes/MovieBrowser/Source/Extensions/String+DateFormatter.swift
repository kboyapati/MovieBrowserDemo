//
//  DateFormatter+CustomDecoding.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/18/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

extension String {
    func date(from format: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat
            return dateFormatter.string(from: date)
        }
        else {
            return ""
        }
    }
}
