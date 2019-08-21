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
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var equipment: UILabel!
    
    var imageName : String?
    var titleText : String?
    var locationText : String?
    var equimentText : String?
    var imageInfoArray : Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName!)
        
        let path = Bundle.main.path(forResource: "ImageInfo", ofType:"plist")
        let dict = NSDictionary(contentsOfFile:path!)
        
        if let imageInfoArray = dict![imageName!] as? Array<String> {
            imageTitle.text = imageInfoArray[0]
            location.text = imageInfoArray[1]
            equipment.text = imageInfoArray[2]
        } else {
            imageTitle.text = ""
            location.text = ""
            equipment.text = ""
        }
    }
}
