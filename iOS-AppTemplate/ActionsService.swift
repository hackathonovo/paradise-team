//
//  ActionsService.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 21/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import SwiftyJSON
import MapKit

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
    
    
    public func createAction(_ users: [User], _ coords: CLLocationCoordinate2D, _ range: Double, _ title: String, _ description: String, onComplete: @escaping ()-> Void) {
        
        let token: [String: String] = ["Authorization": UserDefaultsManager().getValue(forKey: "token_type") + " " + UserDefaultsManager().getValue(forKey: "access_token")]
        

        
        let params: [String: Any] = [
            "latitude": coords.latitude,
            "longitude": coords.longitude,
            "title": title,
            "range": range,
            "action_type_id": "1",
            "info": description,
            "user_num": users.count,
            "user_id0": "6",
            "user_id1": "7",
            "user_id2": "8"
            
        ]
        
        makeRequest(with: ApiPaths.createAction, method: .post, parameters: params, headers: token, completion: { response in
            
            onComplete()
            
            })
       
    }

    
    public func getUsers(latitude: Double, longitude: Double, flag1: Bool, flag2: Bool, flag3: Bool, flag4: Bool, flag5: Bool, onComplete: @escaping ([User])-> Void) {
        
        let token: [String: String] = ["Authorization": UserDefaultsManager().getValue(forKey: "token_type") + " " + UserDefaultsManager().getValue(forKey: "access_token")]
        
        let params: [String: Any] = [
            "latitude": latitude,
            "longitude": longitude,
            "speolog": flag1,
            "alpinist": flag2,
            "medicina": flag3,
            "visokogorstvo": flag4,
            "penjanje": flag5
        ]
        
        makeRequest(with: ApiPaths.userFilter, method: .post, parameters: params, headers: token, completion: { response in
            
            switch response.result {
                
            case .success(let resp):
                
                
                var array: [User] = []
                let json = JSON(resp)
                for (_, object) in json {
                    //print(object)
                    let action = User(json: object)
                    array.append(action)
                    
                }
                
                
                
                
                
                onComplete(array)
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    
}
