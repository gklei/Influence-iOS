//
//  AppDelegate.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit
import Branch
import IQKeyboardManagerSwift
import IncNetworkLayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   var appRouter: AppRouter?
   
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      let baseURL = URL(string: "http://localhost:3000/api")!
      let config = IncNetworkRequestConfiguration(baseURL: baseURL)
      IncNetworkRequestConfiguration.shared = config
      
      let queue = IncNetworkSerialQueue()
      IncNetworkQueue.shared = queue
      
      IQKeyboardManager.sharedManager().enable = true
      IQKeyboardManager.sharedManager().toolbarTintColor = UIColor(.outerSpace)
      
      window = UIWindow()
      appRouter = AppRouter(window: window!)
      
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
}

