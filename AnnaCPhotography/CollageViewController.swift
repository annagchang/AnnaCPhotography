//
//  CollageViewController.swift
//  AnnaCPhotography
//
//  Created by Anna Chang on 8/18/19.
//  Copyright © 2019 Anna Chang. All rights reserved.
//

import UIKit

class CollageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var header: String = ""
    var prefix = ""
    var numOfImages = 0
    var zoomImage = ""
    @IBOutlet weak var collageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = header
        
        let itemSize = UIScreen.main.bounds.width/3 - 3
        
        let layout = UICollectionViewFlowLayout() //grid layout
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        collageCollectionView.collectionViewLayout = layout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myImageCell
        cell.imageView.image = UIImage(named: "\(prefix)\(indexPath.row).JPG")
        if (cell.imageView.image == nil) {
            cell.imageView.image = UIImage(named: "\(prefix)\(indexPath.row).jpg")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        destVC.prefix = "\(prefix)"
        destVC.imageIndex = indexPath.row
        
        self.navigationController?.pushViewController(destVC, animated: true)
    }
}

extension UIImage {
    func correctlyOrientedImage() -> UIImage {
        if self.imageOrientation == .up {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return normalizedImage ?? self;
    }
}
