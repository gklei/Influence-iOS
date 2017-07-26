//
//  WelcomeConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class ProfileConductor: Conductor {
   fileprivate lazy var _welcomeVC: ProfileViewController = {
      let vc = ProfileViewController()
      vc.title = "PROFILE"
      let rightItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear_icon"), style: .plain, target: nil, action: nil)
      rightItem.tintColor = UIColor(.outerSpace)
      vc.navigationItem.rightBarButtonItem = rightItem
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _welcomeVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
   }
   
   override func conductorDidShow(in context: UINavigationController) {
      let loginConductor = SigninConductor()
      loginConductor.show(with: context)
   }
}
