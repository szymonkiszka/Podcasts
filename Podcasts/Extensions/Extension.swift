//
//  Extension.swift
//  Podcasts
//
//  Created by Simon on 12.05.2018.
//  Copyright © 2018 Simon. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
