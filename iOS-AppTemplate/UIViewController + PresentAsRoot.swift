//
//  UIViewController + PresentAsRoot.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var window: UIWindow? {
        return self.view.window ?? (UIApplication.shared.delegate as! AppDelegate).window
    }
    
    var contentViewController: UIViewController? {
        if let navigationViewController = self as? UINavigationController {
            return navigationViewController.topViewController?.contentViewController
        } else {
            return self
        }
    }
    
    func showAsRoot() {
        guard let window = window else {
            return
        }
        window.rootViewController = self
        window.makeKeyAndVisible()
    }
}
