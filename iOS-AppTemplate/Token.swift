//
//  Token.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 18/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Token {
    
    let tokenType: String
    let expiresIn: String
    let accessToken: String
    let refreshToken: String
    
    init(json data: Any) {
        
        let json = JSON(data)
        
        self.tokenType = json["token_type"].stringValue
        self.expiresIn = json["expires_in"].stringValue
        self.accessToken = json["access_token"].stringValue
        self.refreshToken = json["refresh_token"].stringValue
    }
}
