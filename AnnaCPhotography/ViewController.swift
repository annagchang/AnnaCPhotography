//
//  ViewController.swift
//  AnnaCPhotography
//
//  Created by Anna Chang on 8/16/19.
//  Copyright © 2019 Anna Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menuShowing = false
    let categories = ["Portraits", "Earth", "Streets", "B&W", "Film", "Sundry"]

    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    @IBOutlet var homeScreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.tableFooterView = UIView()
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        //if the hamburger menu is NOT visible, then move the ubeView back to where it used to be
        if !menuShowing {
            leadingC.constant = 150
            //this constant is NEGATIVE because we are moving it 150 points OUTWARD and that means -150
            trailingC.constant = -150
        } else {
            //if the hamburger menu IS visible, then move the ubeView back to its original position
            leadingC.constant = 0
            trailingC.constant = 0
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
        menuShowing = !menuShowing
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = categories[indexPath.row]
        
        return cell
    }
}

