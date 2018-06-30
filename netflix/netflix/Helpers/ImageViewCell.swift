//
//  HomeCollectionViewController.swift
//  netflix
//
//  Created by Pedro Servicio on 13/06/18.
//  Copyright © 2018 Servicio. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var imagenPrueba = #imageLiteral(resourceName: "img8")
    var peliculas = [Movie]()
    
    private let itemID = "itemID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let collection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame:.zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.cyan
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setupLayout(){
        addSubview(collection)
        
        collection.register(CoverViewCell.self, forCellWithReuseIdentifier: itemID)
        collection.delegate = self
        collection.dataSource = self
        
        collection.backgroundColor = UIColor.black
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collection]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collection]))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemID, for: indexPath) as! CoverViewCell
        cell.image = imagenPrueba
        cell.etiqueta.text = "holo"
        
        // Configure the cell
        cell.backgroundColor = UIColor.gray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
      print("Estoy Aqui \(indexPath.row)")

//      let detailEvent: DetailEventTableViewController? = DetailEventTableViewController()
//        let detailEventController = UINavigationController(rootViewController: detailEvent!
//        present(detailEventController, animated: true, completion: nil)
        let descriptionView: DescriptionViewController? = DescriptionViewController()
        let descriptionViewController = UINavigationController(rootViewController:descriptionView!)
        
        //self.present(descriptionViewController, animated: true, completion: nil)
    }
    
}
