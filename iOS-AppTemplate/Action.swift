//
//  Action.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 21/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Action {
    
    let id: String
    let title: String
    let latitude: Double
    let longitude: Double
    let range: Double
    let info: String
    
    init(json data: JSON) {
        
        print(data)
        self.id = data["id"].stringValue
        self.title = data["title"].stringValue
        self.latitude = data["latitude"].doubleValue
        self.longitude = data["longitude"].doubleValue
        self.range = data["range"].doubleValue
        self.info = data["info"].stringValue
    }
}
