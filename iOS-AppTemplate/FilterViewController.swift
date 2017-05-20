//
//  FilterViewController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class FilterViewController: BaseViewController {
    
    // MARK: - Dependencies
    
    var models = ["Filter1", "Filter2", "Filter3", "Filter4", "Filter5"]
    
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.setTitle("Cancel", for: .normal)
        }
    }
    @IBOutlet weak var filterTableView: UITableView!
    
    @IBAction func cancelButtonTapped(_: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.setTitle("Save", for: .normal)
        }
    }
    
    @IBAction func saveButtonTapped(_: UIButton) {
        
        //viewModel.getFilteredData(data: models)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.delegate = self
        filterTableView.dataSource = self
        
    }
}
extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < models.count {
            return "Section \(section + 1)"
        }
        return nil
    }
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterTableViewCell", for: indexPath) as! FilterTableViewCell
        
        cell.selectionStyle = .none
        
        //        cell.titleLabel.text = models[indexPath.section].filter[indexPath.row].title
        //        cell.toggle.isOn = models[indexPath.section].filter[indexPath.row].isActive
        
        cell.onSwitch = {
            //            self.models[indexPath.section].filter[indexPath.row].isActive = !self.viewModel.data[indexPath.section].filter[indexPath.row].isActive
        }
        
        return cell
    }
    
}
