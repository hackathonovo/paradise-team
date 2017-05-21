//
//  ActionsService.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 21/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import SwiftyJSON

class ActionService: NetworkingServiceProtocol {
    
    public func getActions(onComplete: @escaping ([Action])-> Void) {
        
        let token: [String: String] = ["Authorization": UserDefaultsManager().getValue(forKey: "token_type") + " " + UserDefaultsManager().getValue(forKey: "access_token")]

        makeRequest(with: ApiPaths.actions, method: .get, parameters: [:], headers: token, completion: { response in
            
            switch response.result {
                
            case .success(let resp):
                
                
                var array: [Action] = []
                let json = JSON(resp)
                for (_, object) in json {
                    //print(object)
                    let action = Action(json: object)
                    array.append(action)
                    
                }
                
                
                
                
                
                onComplete(array)
                
            case .failure(let error):
                print(error)
            }
        })
    }
}
