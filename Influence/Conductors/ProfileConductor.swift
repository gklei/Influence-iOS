//
//  WelcomeConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class ProfileConductor: TabConductor {
   fileprivate lazy var _welcomeVC: ProfileViewController = {
      let vc = ProfileViewController()
      vc.title = "PROFILE"
      vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "user_icon"), selectedImage: #imageLiteral(resourceName: "user_icon_selected"))
      vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _welcomeVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
   }
}
