//
//  BaseNavigationController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    private func customizeNavigationBar() {
        removeShadowFromNavbar()
        //navigationBar.barTintColor = .at_tintColor
        navigationBar.tintColor = .white
        //navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.at_title]
    }
    
    private func removeShadowFromNavbar() {
        navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavigationBar()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
