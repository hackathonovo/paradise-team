//
//  LoginService.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 17/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import Foundation

//http://paradise-hackathon.herokuapp.com/token?client_id=3&client_secret=0bKRZpSosV5dKbCOB7x6TAOSpnSVP9Nce8eexgOp&username=test@mail.com&password=test123

class LoginService: NetworkingServiceProtocol {
    
    internal var parameters: [String: Any]!
    
    public init() {
        loadStaticHeaders()
    }
    
    public func login(username: String, password: String) {
        
        loadStaticHeaders()
        parameters.updateValue(username, forKey: "username")
        parameters.updateValue(password, forKey: "password")
        makeRequest(with: ApiPaths.login, method: .get)
    }
}
