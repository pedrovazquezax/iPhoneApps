//
//  AppCell.swift
//  AppStore
//
//  Created by Pedro Antonio Vazquez Rodriguez on 30/06/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
class AppCell: UICollectionViewCell {
    
    let imageView :UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frozen")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel :UILabel = {
        let label = UILabel()
        label.text = "Disney Build It: Frozen"
        label.font  = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    let categoryLabel :UILabel = {
        let label = UILabel()
        label.text = "Entertainment"
        label.font  = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()
    let priceLabel :UILabel = {
        let label = UILabel()
        label.text = "$3.99"
        label.font  = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpViews(){
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width+56, width: frame.width, height: 20)
        
        
        
    }
}
