//
//  OnBoardingCoordinator.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 21/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class OnBoardingCoordinator: Coordinator {
    
    private var navigationController = BaseNavigationController()
    
    var onComplete: ((UserType) -> Void)?
    
    @discardableResult
    func start() -> UIViewController {
        
        let onBoardingVC = OnBoardingViewController.instance()
        onBoardingVC.shouldNavigateToLobby = { [weak self] userType in
            
            self?.onComplete?(userType)
        }
        
        navigationController.viewControllers = [onBoardingVC]
        onBoardingVC.navigationBarDisplayMode = .always
        return navigationController
    }
}
