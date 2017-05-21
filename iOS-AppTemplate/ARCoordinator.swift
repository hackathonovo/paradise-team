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
        let placeVC = PlaceViewController.instance()

        navigationController.viewControllers = [placeVC]
        placeVC.navigationBarDisplayMode = .always
        return navigationController
    }
}
