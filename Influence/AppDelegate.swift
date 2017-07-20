//
//  AppDelegate.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
      let rootNav = UINavigationController(rootViewController: ViewController())
      window = UIWindow()
      window?.rootViewController = rootNav
      window?.makeKeyAndVisible()
      
      return true
   }
}

