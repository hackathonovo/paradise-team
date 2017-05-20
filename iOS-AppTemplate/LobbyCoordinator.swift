//
//  LobbyCoordinator.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class LobbyCoordinator: Coordinator {
    
    private var navigationController = BaseNavigationController()
    internal var childCoordinators: [Coordinator] = []
    
    func start() -> UIViewController {
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
    
    func showActionsList() {
        let actionsList = ActionsTableViewController.instance()
        navigationController.pushViewController(actionsList, animated: true)
        actionsList.onShouldShowActionDetails = { [weak self] index in
            
            self?.showActionDetails(index: index)
        }
    }
    
    func showActionDetails(index: Int) {
        let actionDetailsVC = ActionDetailsViewController.instance()
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
        createEditAction.onShouldNavigateToUserList = { [weak self] in
            
            self?.showCreateUsersListViewController()
            
        }
        navigationController.pushViewController(createEditAction, animated: true)
    }
    
    func showCreateUsersListViewController() {
        let usersListViewController = UsersListViewController.instance()
        usersListViewController.rootViewController = navigationController
        usersListViewController.onShouldNavigateToDescriptionViewController = { [weak self] in
            self?.showDescriptionViewController()
        }
        
        navigationController.pushViewController(usersListViewController, animated: true)
    }
    
    
    func showDescriptionViewController() {
        let descriptionViewController = DescriptionViewController.instance()
        descriptionViewController.shouldDismissNavigationController = { [weak self] in
            self?.navigationController.dismiss(animated: true, completion: {})
            _ = self?.start()
        }
        navigationController.pushViewController(descriptionViewController, animated: true)
    }
    
    
    
    
}
