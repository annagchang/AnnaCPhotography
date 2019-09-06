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
    let categories = ["People", "Earth", "Concrete", "B&W", "Film", "and Sundry"]

    @IBOutlet weak var menuHeight: NSLayoutConstraint!
    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    @IBOutlet var homeScreen: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.init(name: "Euphemia UCAS", size: 18)
        cell.backgroundColor = UIColor(displayP3Red: 0/255, green: 119/255, blue: 179/255, alpha: 1.0)
        
        //color of selected cell
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(displayP3Red: 73/255, green: 195/255, blue: 239/255, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCollage", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var selectedRowIndex = self.menuTableView.indexPathForSelectedRow
        
        if (segue.identifier == "toCollage") {
            var destVC : CollageViewController = segue.destination as! CollageViewController
            destVC.header = categories[selectedRowIndex!.row]
            if (selectedRowIndex!.row == 0) {
                destVC.numOfImages = 25
                destVC.prefix = "P"
            } else if (selectedRowIndex!.row == 1) {
                destVC.numOfImages = 10
                destVC.prefix = "E"
            } else if (selectedRowIndex!.row == 2) {
                destVC.numOfImages = 10
                destVC.prefix = "CS"
            } else if (selectedRowIndex!.row == 3) {
                destVC.numOfImages = 10
                destVC.prefix = "BW"
            } else if (selectedRowIndex!.row == 4) {
                destVC.numOfImages = 10
                destVC.prefix = "F"
            } else if (selectedRowIndex!.row == 5) {
                destVC.numOfImages = 10
                destVC.prefix = "S"
            } else {
                destVC.numOfImages = 0
                destVC.prefix = ""
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.menuHeight?.constant = self.menuTableView.contentSize.height
    }
}

