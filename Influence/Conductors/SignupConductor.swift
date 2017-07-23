//
//  SignupConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class SignupConductor: Conductor {
   fileprivate lazy var _loginVC: SignupViewController = {
      let vc = SignupViewController()
      vc.title = "SIGNUP"
      vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "user_icon"), selectedImage: #imageLiteral(resourceName: "user_icon_selected"))
      vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _loginVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
   }
}
