//
//  LobbyViewController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

final class LobbyViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var feedTableView: UITableView!
    
    // MARK: - Dependencies
    
    //var viewModel: FeedViewModel!
    //private var manager: TableViewManager<FeedCellModel, FeedCell>!
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
       // navigationItem.title = Localizable.feed_title
        
       // createTableViewManager()
        //addCallbacks(to: viewModel)
        
       // viewModel.loadInitialData()
//        addPullToRefresh()
//        
//        manager.onSelectedCell { [weak self] index, _ in
//            self?.viewModel.goToDetails(selectedItemIndex: index)
//        }
//        
//        manager.onReachEndOfTable = { [weak self] in
//            self?.viewModel.reachedEndOfList()
//        }
    }
    
//    func addCallbacks(to viewModel: FeedViewModel) {
//        
//        viewModel.onUpdate = { [weak self] data in
//            self?.manager.data = data
//        }
//        
//        viewModel.onEndedActivity = { [weak self] in
//            self?.refreshControl.endRefreshing()
//        }
//    }
//    
//    private func createTableViewManager() {
//        manager = TableViewManager(feedTableView, initialData: viewModel.models) { index, cell, data in
//            cell.model = data
//        }
//    }
    
    // MARK: - UserInteraction
    
    func addPullToRefresh() {
        feedTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToRefreshActivated), for: .valueChanged)
    }
    
    // MARK: - Utility
    
    func pullToRefreshActivated() {
       // viewModel.pullToRefresh()
    }
    
}

