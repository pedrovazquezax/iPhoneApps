//
//  UITabBarController.swift
//  netflix
//
//  Created by Pedro Servicio on 13/06/18.
//  Copyright © 2018 Servicio. All rights reserved.
//

import UIKit

class MainControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let home = HomeCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let homeController = UINavigationController(rootViewController: home)
        homeController.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
        homeController.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_selected")
//
//
//        let favorites = FavoritesTableViewController(collectionViewLayout: UICollectionViewFlowLayout())
//        let favoritesController = UINavigationController(rootViewController: favorites)
//        favoritesController.tabBarItem.image = #imageLiteral(resourceName: "like_unselected")
//        favoritesController.tabBarItem.selectedImage = #imageLiteral(resourceName: "like_selected")
//
//        let admin = AdminViewController()
//        let adminController = UINavigationController(rootViewController: admin)
//
//        adminController.tabBarItem.image = #imageLiteral(resourceName: "tickets_unselected")
//        adminController.tabBarItem.selectedImage = #imageLiteral(resourceName: "tickets_selected")
//
//
        let profile = ProfileViewController()
        let profileController = UINavigationController(rootViewController: profile)
        
        profileController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        profileController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        
        let search = SearchViewController()
        let searchController = UINavigationController(rootViewController: search)

        searchController.tabBarItem.image = #imageLiteral(resourceName: "search")
        searchController.tabBarItem.selectedImage = #imageLiteral(resourceName: "search_filled")
//
        tabBar.tintColor = UIColor.red
        tabBar.barTintColor = UIColor.black
//
       viewControllers = [homeController,searchController,profileController]
//
//
     }

}
