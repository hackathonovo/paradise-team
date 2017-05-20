//
//  DescriptionViewController.swift
//  iOS-AppTemplate
//
//  Created by Blaž Jurišić on 20/05/2017.
//  Copyright © 2017 Blaž Jurišić. All rights reserved.
//

import UIKit

class DescriptionViewController: BaseViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBAction func sendAction(_ sender: UIButton) {
        //self.rootNavigationController?.dismiss(animated: true, completion: {
        shouldDismissNavigationController?()
    }
    
    var shouldDismissNavigationController: (()-> Void)?
    var rootNavigationController: BaseNavigationController?
    
    override func viewDidLoad() {
        
        textView.delegate = self
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.gray.cgColor
        
        self.hideKeyboard()
    }
}



extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
}
