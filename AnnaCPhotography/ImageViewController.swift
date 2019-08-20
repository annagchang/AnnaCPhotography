//
//  ImageViewController.swift
//  AnnaCPhotography
//
//  Created by Anna Chang on 8/20/19.
//  Copyright © 2019 Anna Chang. All rights reserved.
//
import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var imageName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName!)
    }
}
