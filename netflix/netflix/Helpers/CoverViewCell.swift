//
//  HomeCollectionViewController.swift
//  netflix
//
//  Created by Pedro Servicio on 13/06/18.
//  Copyright © 2018 Servicio. All rights reserved.
//

import UIKit

class CoverViewCell : UICollectionViewCell{
    
    var image: UIImage?{
        didSet {
            if let image = image {
                imageCover.image = image
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageCover: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "queen")
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    let etiqueta: UILabel = {
        let label = UILabel()
        label.text = "texto Prueba"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 2
        return label
        
    }()
    
    func setupLayout(){
        addSubview(imageCover)
        addSubview(etiqueta)
        
        imageCover.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 40)
        etiqueta.frame = CGRect(x: 5, y: frame.width + 57, width: frame.width, height: 20)
    }
   
    
    
}
