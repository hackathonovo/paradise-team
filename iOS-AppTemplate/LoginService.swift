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

        makeRequest(with: ApiPaths.login, method: .get, parameters: params, completion: { response in
            
            switch response.result {
                
            case .success(let json):
                
                let token = Token(json: json)
                let manager = UserDefaultsManager()
                
                manager.setValue(token.accessToken, forKey: "access_token")
                onComplete()

            case .failure(let error):
                print(error)
            }
        })
    }
}
