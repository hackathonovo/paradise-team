//
//  FIlterTableViewCell.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var toggle: UISwitch!
    
    // MARK: - Dependencies
    
    var onSwitch: (() -> Void)?
    
    // MARK: - UserInteraction
    @IBAction func onSwitchTapped(_: UISwitch) {
        onSwitch?()
    }
    
}
