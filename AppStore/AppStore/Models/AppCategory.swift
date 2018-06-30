//
//  AppCategory.swift
//  AppStore
//
//  Created by Pedro Antonio Vazquez Rodriguez on 30/06/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    
    var name: String?
    var apps:[App]?
    static func sampleAppCategory() -> [AppCategory]{
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name =  "Best New Apps"
        var apps = [App]()
        
        let frozenApp = App()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entretainment"
        frozenApp.price = NSNumber(floatLiteral: 4.99)
        apps.append(frozenApp)
        bestNewAppsCategory.apps = apps
        
        return [bestNewAppsCategory]
        
        
    }
}
class App: NSObject {
    
    var id : NSNumber?
    var name :String?
    var category: String?
    var imageName:String?
    var price : NSNumber?
}
