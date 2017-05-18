//
//  UserDefaultsService.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 18/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    let defaults = UserDefaults.standard
    
    init() {

    }
    
    func setValue(_ value: Any, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    func getValue(key: String) -> String {
        return defaults.string(forKey: key)!
    }
}

