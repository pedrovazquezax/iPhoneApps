//
//  ProfileViewController.swift
//  netflix
//
//  Created by Pedro Servicio on 13/06/18.
//  Copyright © 2018 Servicio. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    let imageProfileView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "logImage")
        return image
    }()
    
    let nameStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    let lastNameStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    let emailStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    let verticalStackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nombre"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.red
        label.textAlignment = .center
        return label
    }()
    
    let userNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.red
        label.textAlignment = .center
        return label
    }()
    
    let lastNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Apellido"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.red
        label.textAlignment = .center
        return label
    }()
    
    let userLastNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.red
        label.textAlignment = .center
        return label
    }()
    
    let emailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.red
        label.textAlignment = .center
        return label
    }()
    
    let userEmailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.red
        label.textAlignment = .center
        return label
    }()
    
    let imageStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    let labelStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 20
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self , action: #selector(handleLogout))
        checkIfUserIsLoggedIn()
        
        
        view.addSubview(verticalStackView)
        
        
        setUpGeneralVerticalStackView()
        setUpProfileImage()
        
        // Do any additional setup after loading the view.
    }
    func setUpProfileImage(){
        imageProfileView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageProfileView.heightAnchor.constraint(equalTo: verticalStackView.widthAnchor, multiplier:0.5).isActive = true
        imageProfileView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor, multiplier:0.5).isActive = true
        imageProfileView.layer.cornerRadius = (view.frame.size.width - 40) / 4
        imageProfileView.clipsToBounds = true
        
    }
    
    func setUpGeneralVerticalStackView(){
        
        
        imageStack.addArrangedSubview(imageProfileView)
        
        
        nameStack.addArrangedSubview(nameLabel)
        nameStack.addArrangedSubview(userNameLabel)
        
        lastNameStack.addArrangedSubview(lastNameLabel)
        lastNameStack.addArrangedSubview(userLastNameLabel)
        
        emailStack.addArrangedSubview(emailLabel)
        emailStack.addArrangedSubview(userEmailLabel)
        
        labelStack.addArrangedSubview(nameStack)
        labelStack.addArrangedSubview(lastNameStack)
        labelStack.addArrangedSubview(emailStack)
        
        
        verticalStackView.addArrangedSubview(imageStack)
        verticalStackView.addArrangedSubview(labelStack)
        
        verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
        
        verticalStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        verticalStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        verticalStackView.spacing = view.frame.size.width / 6
        
        // verticalStackView.widthAnchor.accessibilityFrame.size
    }
    
    //helpers
    func checkIfUserIsLoggedIn() {
        
        if Auth.auth().currentUser?.uid == nil{
            
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            
        }else{
            fetchUser()
        }
    }
    
    func fetchUser() {
        guard  let uid =  Auth.auth().currentUser?.uid else{
            return
        }
        Database.database().reference().child("users").child(uid).observe(.value, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                let user = User()
                
                user.name = dictionary["name"] as? String
                user.email = dictionary["email"] as? String
                user.lastName = dictionary["lastName"]as? String
                user.motherLastName = dictionary["motherLastName"]as? String
                user.saldo = dictionary["saldo"]as? String
                self.navigationItem.title = user.name
                self.userNameLabel.text = user.name
                self.userLastNameLabel.text = user.lastName
                self.userEmailLabel.text = user.email
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Saldo: \(user.saldo ?? "200")" , style: .plain, target: self, action: nil)
                
                DispatchQueue.main.async {
                    self.imageProfileView.reloadInputViews()
                    
                }
                
                print(user)
            }
        }, withCancel: nil)
    }
    
    @objc func handleLogout(){
        do {
            try Auth.auth().signOut()
        } catch let  logoutError  {
            print(logoutError)
        }
        let loginController = LoginViewController()
        let logingContoller = UINavigationController(rootViewController: loginController)
        present(logingContoller, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkIfUserIsLoggedIn()
    }
}







