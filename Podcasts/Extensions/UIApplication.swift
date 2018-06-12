//
//  UIApplication.swift
//  Podcasts
//
//  Created by Simon on 08.06.2018.
//  Copyright © 2018 Simon. All rights reserved.
//

import UIKit

extension UIApplication {
    static func mainTabBarController() -> MainTabBarController {
        return shared.keyWindow?.rootViewController as! MainTabBarController
    }
}
