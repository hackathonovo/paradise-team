//
//  MainCoordinator.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 19/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    
    @discardableResult
    func start() -> UIViewController
}

class MainCoordinator: Coordinator {
    
    private var userDefaultsManager: UserDefaultsManager
    private var onBoardingCoordinator: OnBoardingCoordinator?
    
    init() {
        //self.persistenceService = persistenceService
        self.userDefaultsManager = UserDefaultsManager()
    }
    
    fileprivate var childCoordinators: [Coordinator] = [
        LobbyCoordinator(),
        ARCoordinator()
    ]
    
    @discardableResult
    func start()-> UIViewController {
        
        if let value = UserDefaultsManager().getValue(forKey: "userType")  {
            return startLobby()
            
        } else {
            return createOnboarding()
        }
    }
    
    private func createOnboarding()-> UIViewController {
        onBoardingCoordinator = OnBoardingCoordinator()
        onBoardingCoordinator!.onComplete = { [weak self] userType in
            let manager = UserDefaultsManager()
            var value: String? = nil
            switch userType {
            case .leader:
                value = "leader"
            case .user:
                value = "user"
            }
            
        
            manager.setValue(value!, forKey: "userType")
            
            self?.startLobby()
            self?.onBoardingCoordinator = nil
        }
        let onBoardingController = onBoardingCoordinator!.start()
        onBoardingController.showAsRoot()
        return onBoardingController
    }
    
    @discardableResult
    func startLobby()-> UIViewController {
        let tabBarController = createTabBarController()
        tabBarController.showAsRoot()
        return tabBarController
    }
}

// MARK: - Main tab bar
extension MainCoordinator {
    
    fileprivate func tabBarItem(for coordinator: Coordinator)-> UITabBarItem {
        switch coordinator {
        case is LobbyCoordinator:
            return .lobby
            
        case is ARCoordinator:
            return .AR
            //        case is UserProfileCoordinator:
        //            return .userProfile
        default:
            fatalError("No tab bar set for this coordinator!")
        }
    }
    
    fileprivate func createTabBarController()-> UITabBarController {
        
        let tabBarController = UITabBarController()
        
        let viewControllers = childCoordinators.map { coordinator-> UIViewController in
            let vc = coordinator.start()
            vc.tabBarItem = tabBarItem(for: coordinator)
            return vc
        }
        
        tabBarController.viewControllers = viewControllers
        
        return tabBarController
    }
}

extension UITabBarItem {
    
    static let lobby = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "icn_home"), selectedImage: nil)
    static let AR = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "icn_arrow"), selectedImage: nil)
    
}

