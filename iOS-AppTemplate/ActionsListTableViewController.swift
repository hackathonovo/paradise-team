//
//  ActionsList.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class ActionsTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    
    @IBOutlet var actionsTableView: UITableView!
    
    //MARK: - Model
    
   // var model: [String] = ["prva", "druga", "treca", "cetvrta", "peta", "sesta", "sedma", "osma", "deveta", "deseta",]
    var actions: [Action] = [] {
        didSet {
            self.actionsTableView.reloadData()
        }
    }
    //MARK: - Lifecycle

    var onShouldShowActionDetails: ((Action)-> Void)?
    
    func makeRequest() {
        
        let actionService = ActionService()
        actionService.getActions(onComplete: { [weak self] actions in
            
            self?.actions = actions
        })
        
        
        
    }
    
    override func viewDidLoad() {
        makeRequest()
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionsTableViewCell", for: indexPath) as! ActionsTableViewCell
        guard (indexPath as IndexPath).row < actions.count else {
            
            return UITableViewCell()
        }
        
        cell.titleLabel.text = actions[indexPath.row].title
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            actions.remove(at: (indexPath as IndexPath).row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    
    
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onShouldShowActionDetails?(actions[indexPath.row])
    }
}


