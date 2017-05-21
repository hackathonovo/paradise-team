//
//  LobbyCoordinator.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit
import MapKit

class LobbyCoordinator: Coordinator {
    
    private var navigationController = BaseNavigationController()
    internal var childCoordinators: [Coordinator] = []
    
    func start() -> UIViewController {
        
        let userType = UserDefaultsManager().getValue(forKey: "userType")
        
        switch userType! {
        case "leader":
            
            let lobby = LobbyViewController.instance()
            
            lobby.onShouldGoToActionsList = { [weak self] in
                self?.showActionsList()
            }
            
            lobby.onShouldGoToCreateAction = { [weak self] in
                self?.showCreateEditAction()
            }
            
            navigationController.viewControllers = [lobby]
            lobby.navigationBarDisplayMode = .always
            return navigationController
            
            
            
        case "user":
            let actionsList = ActionsTableViewController.instance()
            navigationController.viewControllers = [actionsList]
            actionsList.navigationBarDisplayMode = .always
            actionsList.onShouldShowActionDetails = { [weak self] action in
                
                self?.showActionDetails(action: action)
            }
            
            return navigationController
            
        default:
            
            let lobby = LobbyViewController.instance()
            
            lobby.onShouldGoToActionsList = { [weak self] in
                self?.showActionsList()
            }
            
            lobby.onShouldGoToCreateAction = { [weak self] in
                self?.showCreateEditAction()
            }
            
            navigationController.viewControllers = [lobby]
            lobby.navigationBarDisplayMode = .always
            return navigationController
            
        }
        
    }
    
    func showActionsList() {
        let actionsList = ActionsTableViewController.instance()
        navigationController.pushViewController(actionsList, animated: true)
        actionsList.onShouldShowActionDetails = { [weak self] action in
            
            self?.showActionDetails(action: action)
        }
    }
    
    func showActionDetails(action: Action) {
        let actionDetailsVC = ActionDetailsViewController.instance()
        actionDetailsVC.model = action
        actionDetailsVC.shouldInitChat = { [weak self] in
            self?.initChat()
        }
        navigationController.pushViewController(actionDetailsVC, animated: true)
        
    }
    
    func initChat() {
        let chatVC = LoginViewController.instance()
        
        navigationController.pushViewController(chatVC, animated: true)
    }
    
    func showCreateEditAction() {
        let createEditAction = CreateEditActionViewController.instance()
        createEditAction.onShouldNavigateToUserList = { [weak self] title, range, coordinates in
            
            self?.showCreateUsersListViewController(title,range,coordinates)
            
        }
        navigationController.pushViewController(createEditAction, animated: true)
    }
    
    func showCreateUsersListViewController(_ title: String, _ range: Double, _ coords:CLLocationCoordinate2D ) {
        let usersListViewController = UsersListViewController.instance()
        usersListViewController.actionTitle = title
        usersListViewController.range = range
        usersListViewController.coords = coords
        usersListViewController.rootViewController = navigationController
        usersListViewController.onShouldNavigateToDescriptionViewController = { [weak self] users, coords, range, title in
            self?.showDescriptionViewController(users,coords, range, title)
        }
        
        navigationController.pushViewController(usersListViewController, animated: true)
    }
    
    
    func showDescriptionViewController(_ users: [User], _ coords: CLLocationCoordinate2D, _ range: Double, _ title: String) {
        let descriptionViewController = DescriptionViewController.instance()
        descriptionViewController.shouldDismissNavigationController = { [weak self] description in
            
            self?.makeRequest(users, coords, range, title, description, onComplete: { [weak self] in
                
                self?.navigationController.dismiss(animated: true, completion: {})
                _ = self?.start()
                
                
            })
            
            
            
        }
        navigationController.pushViewController(descriptionViewController, animated: true)
    }
    
    
    func makeRequest(_ users: [User], _ coords: CLLocationCoordinate2D, _ range: Double, _ title: String, _ description: String, onComplete: @escaping ()-> Void) {
        let service = ActionService()
        service.createAction(users, coords, range, title, description, onComplete: onComplete)
    }
    
    
    
}
