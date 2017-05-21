//
//  UsersListViewController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit
import MapKit


class UsersListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var usersListTableView: UITableView!
    
    var rootViewController: BaseNavigationController?
    var onShouldNavigateToDescriptionViewController: (([User],CLLocationCoordinate2D ,Double, String)-> Void)?
    
    var actionTitle: String?
    var range: Double?
    var coords: CLLocationCoordinate2D?
    
    //MARK: - Outlets
    
    //MARK: - Model
    
    var model: [User] = []
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        loadData()
        
        let rightBarButtonItemFilter = UIBarButtonItem(title: "⚙️", style: .plain, target: self, action: #selector(showFilter))
        let rightBarButtonItemNext = UIBarButtonItem(title: "Dalje", style: .done, target: self, action: #selector(nextTapped))
        
        
        
        self.navigationItem.rightBarButtonItems = [rightBarButtonItemNext, rightBarButtonItemFilter]
        
        
    }
    
    func castToBool(_ string: String) -> Bool {
        switch string {
        case "true": return true
        case "false": return false
        default: return false
        }
    }
    
    func loadData() {
        
        let manager = UserDefaultsManager()
        
//        let flag1 = castToBool((manager.getValue(forKey: "speolog")?)!)
//        let flag2 = castToBool((manager.getValue(forKey: "alpinist")?)!)
//        let flag3 = castToBool((manager.getValue(forKey: "medicina")?)!)
//        let flag4 = castToBool((manager.getValue(forKey: "visokogorstvo")?)!)
//        let flag5 = castToBool((manager.getValue(forKey: "penjanje")?)!)
//        
        
        
        let actionsService = ActionService()
        actionsService.getUsers(latitude: (coords?.latitude)!, longitude: (coords?.longitude)!, flag1: true, flag2: true, flag3: false, flag4: false, flag5: true) { [weak self] (users) in
            self?.model = users
            self?.usersListTableView.reloadData()

        }
    }
    
    //MARK: - FILTER
    
//    private func addFilterButton() -> UIBarButtonItem {
//        
//        
//        let filterButton = UIButton(type: .custom)
//        filterButton.setImage(#imageLiteral(resourceName: "filterIcon"), for: .normal)
//        filterButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        filterButton.addTarget(self, action: #selector(showFilter), for: .touchUpInside)
//        let navigationItem = UIBarButtonItem(customView: filterButton)
//        return navigationItem
//        
//    }
    
    func showFilter() {
        
        let filterVC = UIStoryboard(name: "FilterViewController", bundle: nil).instantiateViewController(withIdentifier: "FilterViewController")

        
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = filterVC.view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        let lastIndex = navigationController?.view.subviews.count
//        navigationController!.view.insertSubview(blurEffectView, at: lastIndex!)
//        
        
        filterVC.modalPresentationStyle = .overFullScreen
//        filterVC.onShouldPopBlurScreen = { _ in
//            blurEffectView.removeFromSuperview()
//        }
        navigationController!.present(filterVC, animated: true, completion: nil)
    }
//
    func nextTapped() {
        onShouldNavigateToDescriptionViewController?(model, coords!, range!, actionTitle!)
    }
    
    
    
    //MARK: - TableView
    
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersListTableViewCell", for: indexPath) as! UsersListTableViewCell
        guard (indexPath as IndexPath).row < model.count else {
            
            return UITableViewCell()
        }
        
        cell.titleLabel.text = model[indexPath.row].firstName + " " + model[indexPath.row].lastName
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.remove(at: (indexPath as IndexPath).row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    
    
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    
}
