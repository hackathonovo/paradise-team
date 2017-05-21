//
//  User.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 21/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//


import Foundation
import SwiftyJSON

struct User {
    
    let id: String
    let firstName: String
    let lastName: String
   
    
    init(json data: JSON) {
        
        print(data)
        self.id = data["id"].stringValue
        self.firstName = data["first_name"].stringValue
        self.lastName = data["last_name"].stringValue

    }
}
