//
//  HomeCollectionViewController.swift
//  netflix
//
//  Created by Pedro Servicio on 13/06/18.
//  Copyright © 2018 Servicio. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var movies = [#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img2"),#imageLiteral(resourceName: "img3"),#imageLiteral(resourceName: "img4"),#imageLiteral(resourceName: "img5"),#imageLiteral(resourceName: "img6"),#imageLiteral(resourceName: "img7"),#imageLiteral(resourceName: "img9"),#imageLiteral(resourceName: "img11"),#imageLiteral(resourceName: "img12")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        navigationItem.title = "Team Rocket"
        getBalance()

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(ImageViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checkIfUserIsLoggedIn() {
        
        if Auth.auth().currentUser?.uid == nil{
            
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            
        }else{
            //fetchUser()
        }
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
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageViewCell
        // Configure the cell
        cell.imagenPrueba = movies[indexPath.row]
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func getBalance() {
        guard  let uid =  Auth.auth().currentUser?.uid else{
            return
        }
        Database.database().reference().child("users").child(uid).observe(.value, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                let saldo = dictionary["saldo"]as? String
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Saldo: \(saldo ?? "200")" , style: .plain, target: self, action: nil)
                
            }
        }, withCancel: nil)
    }

}
