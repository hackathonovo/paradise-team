//
//  FilterViewController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit


class FilterViewController: UITableViewController {
    
    // MARK: - Dependencies
    @IBOutlet weak var speolog: UISwitch!
    @IBOutlet weak var alpinist: UISwitch!
    @IBOutlet weak var medicina: UISwitch!
    @IBOutlet weak var visokogorstvo: UISwitch!
    @IBOutlet weak var planinar: UISwitch!
    
    var onShouldPopBlurScreen: (()-> Void)?
    
    //var models = ["Filter1", "Filter2", "Filter3", "Filter4", "Filter5"]
    
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.setTitle("Cancel", for: .normal)
        }
    }
    @IBOutlet weak var filterTableView: UITableView!
    
    @IBAction func cancelButtonTapped(_: UIButton) {
       // onShouldPopBlurScreen?()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.setTitle("Save", for: .normal)
        }
    }
    
    @IBAction func saveButtonTapped(_: UIButton) {
        
        //viewModel.getFilteredData(data: models)
        onShouldPopBlurScreen?()
        let manager = UserDefaultsManager()
        manager.setValue(speolog.isOn, forKey: "speolog")
        manager.setValue(alpinist.isOn, forKey: "alpinist")
        manager.setValue(medicina.isOn, forKey: "medicina")
        manager.setValue(visokogorstvo.isOn, forKey: "visokogorstvo")
        manager.setValue(planinar.isOn, forKey: "planinar")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
