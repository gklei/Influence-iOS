//
//  AppDelegate.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit
import Firebase
import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
      _setupFirebase()
      _setupMainWindow()
      
      let branch: Branch = Branch.getInstance()
      branch.initSession(launchOptions: launchOptions, automaticallyDisplayDeepLinkController: true, deepLinkHandler: { params, error in
         if error == nil {
            // params are the deep linked params associated with the link that the user clicked -> was re-directed to this app
            // params will be empty if no data found
            // ... insert custom logic here ...
            print("params: \(String(describing: params?.description))")
         }
      })
      
      return true
   }
   
   // Respond to URI scheme links
   func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
      // pass the url to the handle deep link call
      Branch.getInstance().handleDeepLink(url);
      
      // do other deep link routing for the Facebook SDK, Pinterest SDK, etc
      return true
   }
   
   // Respond to Universal Links
   func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
      // pass the url to the handle deep link call
      Branch.getInstance().continue(userActivity)
      
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

