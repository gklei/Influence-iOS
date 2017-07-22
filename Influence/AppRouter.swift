//
//  AppRouter.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

struct AppRouter {
   private let rootNavigationController = UINavigationController()
   let mainConductor = MainConductor()
   
   init(window: UIWindow) {
      window.rootViewController = rootNavigationController
      window.makeKeyAndVisible()
      
      mainConductor.show(with: rootNavigationController)
   }
}
