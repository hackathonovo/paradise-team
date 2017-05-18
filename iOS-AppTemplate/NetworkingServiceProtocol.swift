//
//  NetworkingServiceProtocol.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 17/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkingServiceProtocol: class {
    
    var parameters: [String: Any]! { get set }
    
}

extension NetworkingServiceProtocol {
    
    internal func loadStaticHeaders() {
        
        parameters = [:]
        for (key, value) in AppConfig.staticHeaders {
            parameters[key] = value
        }
    }
    
    internal func makeRequest(with route: String = "", method: HTTPMethod = .get, encoding: ParameterEncoding = URLEncoding.default) {
        
        let path = AppConfig.baseUrl + route   
        
        let req = request(path, method: method, parameters: parameters, encoding: encoding, headers: AppConfig.staticHeaders)
            .responseString { response in
                print(response)
        }
        print(req)
    }
    
    //TODO: One more argument, callback with model init (parse logic in init)
}
