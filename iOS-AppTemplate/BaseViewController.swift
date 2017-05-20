//
//  UIViewController + extensions.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    enum NavigationBarDisplayMode {
        case always
        case never
        case automatic
    }
    
    var navigationBarDisplayMode: NavigationBarDisplayMode = .automatic {
        didSet {
            
            guard let navigationController = navigationController else {
                return
            }
            
            switch navigationBarDisplayMode {
            case .always:
                navigationController.isNavigationBarHidden = false
            case .automatic:
                let isFirstViewController = navigationController.viewControllers.count == 1
                navigationController.isNavigationBarHidden = !isFirstViewController
            case .never:
                navigationController.isNavigationBarHidden = true
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension BaseViewController {
    
    open class func instance() -> Self {
        if let vc = createFromStoryboard(type: self) {
            return vc
        } else {
            print("WARNING: can't create view controller from storybard:\(self)")
            return self.init()
        }
    }
    
    private class func createFromStoryboard<T: UIViewController>(type: T.Type) -> T? {
        
        let storyboardName = String(describing: type)
        
        let bundle = Bundle(for: T.self)
        
        guard bundle.path(forResource: storyboardName, ofType: "storyboardc") != nil else {
            return nil
        }
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        
        guard let vc = storyboard.instantiateInitialViewController() else {
            print("no vc in storyboard(hint: check initial vc)") ; return nil
        }
        
        return vc as? T
    }
    
}
