//
//  ARCoordinator.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//
import UIKit

class ARCoordinator: Coordinator {
    
    private var navigationController = BaseNavigationController()
    
    func start() -> UIViewController {
        let lobby = PlaceViewController.instance()
        //let viewModel = FeedViewModel(ServiceFactory.feedService)
        //feed.viewModel = viewModel
        //        viewModel.onShouldShowDetails = { [weak self] feedItem in
        //            guard let strongSelf = self else { return }
        //            strongSelf.showDetail(for: feedItem)
        //        }
        navigationController.viewControllers = [lobby]
        lobby.navigationBarDisplayMode = .always
        return navigationController
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
