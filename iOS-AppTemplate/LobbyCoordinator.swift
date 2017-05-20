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
    
    init() {
    }
    
    func showActionsList() {
        let actionsList = ActionsTableViewController.instance()
        navigationController.pushViewController(actionsList, animated: true)
        
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
            self?.start()
        }
        navigationController.pushViewController(descriptionViewController, animated: true)
    }
    
    
    
    
}
