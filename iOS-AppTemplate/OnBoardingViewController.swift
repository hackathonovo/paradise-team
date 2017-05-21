//
//  OnBoardingViewController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 21/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

enum UserType {
    
    case leader
    case user
}


class OnBoardingViewController: BaseViewController {
    
    var loginService: LoginService!
    var shouldNavigateToLobby: ((UserType)-> Void)?
    
    override func viewDidLoad() {
        loginService = LoginService()

    }
    
    @IBAction func loginLeader(_ sender: UIButton) {
        
        self.view.isUserInteractionEnabled = false
        loginService.login(username: "59206fb612342@email.com", password: "password") { 
            self.shouldNavigateToLobby?(.leader)
        }
        
        
    }
    
    @IBAction func loginUser(_ sender: UIButton) {
        self.view.isUserInteractionEnabled = false
        
        loginService.login(username: "5920dd3729b2b@email.com", password: "password") {
            self.shouldNavigateToLobby?(.user)
        }
        
    }
    
    
}
