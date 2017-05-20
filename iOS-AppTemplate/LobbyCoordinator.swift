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
    
    func start() -> UIViewController {
        let lobby = LobbyViewController.instance()
        lobby.onShouldGoToActionsList = { [weak self] in
            self?.showActionsList()
        }
        
        navigationController.viewControllers = [lobby]
        lobby.navigationBarDisplayMode = .always
        return navigationController
    }
    
    func showActionsList() {
        let actionsList = ActionsTableViewController.instance()
        navigationController.pushViewController(actionsList, animated: true)
        
    }
    
    //    func showDetail(for feedItem: FeedItem) {
    //        let feedDetails = FeedDetailsViewController.instance()
    //        let viewModel = FeedDetailsViewModel(ServiceFactory.feedService, feedItem: feedItem)
    //        feedDetails.viewModel = viewModel
    //
    //        viewModel.onGoToAdoption = { [weak self] in
    //            self?.showAdoption(for: feedItem)
    //        }
    //
    //        navigationController.pushViewController(feedDetails, animated: true)
    //    }
    //
    //    func showAdoption(for feedItem: FeedItem) {
    //        let viewController = AdoptViewController.instance()
    //        let viewModel = AdoptViewModel(ServiceFactory.feedService, feedItem: feedItem)
    //        viewController.viewModel = viewModel
    //
    //        let adoptNavigationController = BaseNavigationController()
    //
    //        viewModel.onComplete = {
    //            adoptNavigationController.dismiss(animated: true)
    //        }
    //
    //        adoptNavigationController.viewControllers = [viewController]
    //        navigationController.present(adoptNavigationController, animated: true)
    //    }
}
