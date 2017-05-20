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
    
}

extension NetworkingServiceProtocol {
    
    
    internal func makeRequest(with route: String = "", method: HTTPMethod = .get, parameters: Parameters, encoding: ParameterEncoding = URLEncoding.default, headers customHeaders: HTTPHeaders? = nil, completion: @escaping (DataResponse<Any>)-> Void) {
        
        let path = AppConfig.baseUrl + route
        let headers = prepareHeaders(headers: customHeaders)
        
        print(headers)
        let req = request(path, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseString { response in
                print(response)
            }
            .responseJSON { response in
                
                completion(response)
        }
        print(req)
    }
    
    
    
    func prepareHeaders(headers customHeaders: HTTPHeaders?) -> HTTPHeaders {
        
        var headers = AppConfig.staticHeaders
        
        guard customHeaders != nil else { return headers }
        
        for (key, value) in customHeaders! {
            headers[key] = value
        }
        
        return headers
    }
}
