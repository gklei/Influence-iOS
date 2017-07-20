//
//  AppDelegate.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
      _setupFirebase()
      _setupMainWindow()
      
      return true
   }
   
   private func _setupFirebase() {
      let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")!
      let options = FirebaseOptions(contentsOfFile: path)!
      FirebaseApp.configure(options: options)
   }
   
   private func _setupMainWindow() {
      let rootNav = UINavigationController(rootViewController: ViewController())
      window = UIWindow()
      window?.rootViewController = rootNav
      window?.makeKeyAndVisible()
   }
}

