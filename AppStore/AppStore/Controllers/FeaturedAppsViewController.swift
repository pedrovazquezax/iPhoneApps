//
//  ViewController.swift
//  AppStore
//
//  Created by Pedro Antonio Vazquez Rodriguez on 30/06/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class FeaturedAppsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var appCategories = [AppCategory]?()
    private let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        appCategories = AppCategory.sampleAppCategory()
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let categories = appCategories?.count{
            return categories
        }
        return 0
        
    }
   

}

