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
        navigationBar.barTintColor = .at_tintColor
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.at_title]
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

extension UIFont {
    
    @nonobjc
    static let at_profileTitle = UIFont.systemFont(ofSize: 23, weight: UIFontWeightLight)
    
    @nonobjc
    static let at_title = UIFont.systemFont(ofSize: 18, weight: UIFontWeightLight)
    
    @nonobjc
    static let at_placeholderLabel = UIFont.systemFont(ofSize: 16, weight: UIFontWeightLight)
    
    @nonobjc
    static let at_details = UIFont.systemFont(ofSize: 15, weight: UIFontWeightLight)
    
    @nonobjc
    static let at_subtitle = UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight)
    
    @nonobjc
    static let at_label = UIFont.systemFont(ofSize: 13, weight: UIFontWeightLight)
    
    
}

extension UIColor {
    
    @nonobjc
    static let at_tintColor = UIColor(red: 0/255.0, green: 190/255.0, blue: 223/255.0, alpha: 1)
    
    @nonobjc
    static let at_error = UIColor(red: 255/255.0, green: 97/255.0, blue: 67/255.0, alpha: 1)
    
    @nonobjc
    static let at_disabledButton = UIColor(red: 220/255.0, green: 225/255.0, blue: 230/255.0, alpha: 1)
    
    @nonobjc
    static let at_defaultTextColor = UIColor(red: 46/255.0, green: 47/255.0, blue: 55/255.0, alpha: 1)
    
    @nonobjc
    static let at_lightTextColor = UIColor(red: 178/255.0, green: 184/255.0, blue: 194/255.0, alpha: 1)
    
    @nonobjc
    static let at_inactiveIcon = UIColor(red: 148/255.0, green: 157/255.0, blue: 165/255.0, alpha: 1)
    
    @nonobjc
    static let at_detailsTextColor = UIColor(red: 116/255.0, green: 117/255.0, blue: 130/255.0, alpha: 1)
    
    static let at_success = UIColor(red: 186/255.0, green: 204/255.0, blue: 32/255.0, alpha: 1)
    
    @nonobjc
    static let at_disabledButtonText = UIColor(red: 188/255.0, green: 195/255.0, blue: 202/255.0, alpha: 1)
    
    @nonobjc
    static let at_circleButton = UIColor(red: 231/255.0, green: 235/255.0, blue: 238/255.0, alpha: 1)
    
    @nonobjc
    static let at_separator = UIColor(red: 220/255.0, green: 227/255.0, blue: 233/255.0, alpha: 1)
    
    @nonobjc
    static let at_textView = UIColor(red: 116/255.0, green: 117/255.0, blue: 130/255.0, alpha: 1)
}
