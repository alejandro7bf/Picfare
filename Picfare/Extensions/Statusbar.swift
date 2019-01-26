//
//  Statusbar.swift
//  Picfare
//
//  Created by Alejandro on 1/25/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit

extension UINavigationController {
    override open var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
 
