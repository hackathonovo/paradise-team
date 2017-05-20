//
//  UsersListTableViewCell.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class UsersListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var biggerCubeRadioButton: UIButton!
    @IBOutlet weak var smallerCubeRadioButton: UIView!
    
    @IBAction func triggeredButton(_ sender: UIButton) {
        
        smallerCubeRadioButton.backgroundColor = UIColor.white
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        biggerCubeRadioButton.layer.borderColor = UIColor.gray.cgColor
        biggerCubeRadioButton.layer.borderWidth = 1
        
        biggerCubeRadioButton.layer.cornerRadius = biggerCubeRadioButton.frame.height / 2
        smallerCubeRadioButton.layer.cornerRadius = smallerCubeRadioButton.frame.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
