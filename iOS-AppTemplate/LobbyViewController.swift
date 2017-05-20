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
    
    // MARK: - Navigation callbacks
    
    var onShouldGoToActionsList: (() -> Void)?
    var onShouldGoToCreateAction: (() -> Void)?
    
    @IBAction func goToActionsList(_ sender: UIButton) {
        self.onShouldGoToActionsList?()
    }
    @IBAction func goToCreateAction(_ sender: UIButton) {
        self.onShouldGoToCreateAction?()
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        
        
        
        // MARK: - UserInteraction
        
        
        
    }
}

