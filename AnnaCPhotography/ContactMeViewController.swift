//
//  ContactMeViewController.swift
//  AnnaCPhotography
//
//  Created by Anna Chang on 8/30/19.
//  Copyright © 2019 Anna Chang. All rights reserved.
//

import UIKit

class ContactMeViewController:UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        nameField.delegate = self as! UITextFieldDelegate
        super.viewDidLoad()
    }
    @IBAction func hitSubmit(_ sender: Any) {
        textField.text = "Thanks \(nameField.text!)! I'll get back to you as soon as possible."
    }
}

extension ContactMeViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
