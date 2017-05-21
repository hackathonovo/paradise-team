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
    
    public func login(username: String, password: String, onComplete: @escaping ()-> Void) {
        
        var params = [
            "username" : username,
            "password": password
        ]
        
        for (key, value) in AppConfig.clientSecret {
            params[key] = value
        }

        makeRequest(with: ApiPaths.login, method: .post, parameters: params, completion: { response in
            
            switch response.result {
                
            case .success(let json):
                
                let token = Token(json: json)
                let manager = UserDefaultsManager()
                
                manager.setValue(token.tokenType, forKey: "token_type")
                manager.setValue(token.accessToken, forKey: "access_token")
                
                onComplete()

            case .failure(let error):
                print(error)
            }
        })
    }
    
    public func getUserData(onComplete: ()-> Void) {
        
        let manager = UserDefaultsManager()
    
        let accessToken = manager.getValue(forKey: "access_token")
        let tokenType = manager.getValue(forKey: "token_type")
        
        let header = ["Authorization": tokenType! + " " + accessToken!]
        
        makeRequest(with: ApiPaths.user, method: .get, parameters: [:], headers: header, completion: { response in
            
            switch response.result {
                
            case .success(let json):
                
                print(json)
                
            case .failure(let error):
                print(error)
                
            }
        })
        
        
        
    }
}


