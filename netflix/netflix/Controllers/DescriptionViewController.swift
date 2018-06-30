//
//  DescriptionViewController.swift
//  netflix
//
//  Created by Pedro Antonio Vazquez Rodriguez on 17/06/18.
//  Copyright © 2018 Servicio. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    var movieImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "img1")
    iv.contentMode = .scaleToFill
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
    }()
    
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.allowsEditingTextAttributes = false
        textView.text = "rlkfnfgjk esfhvrskfjjhrgbldniks leobfeus fryge"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(movieImageView)
        view.addSubview(descriptionTextView)
        setUpView()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpView(){
        movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        movieImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

  

}
