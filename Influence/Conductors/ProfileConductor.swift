//
//  WelcomeConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class ProfileConductor: Conductor {
   fileprivate lazy var _profileVC: ProfileViewController = {
      let vc = ProfileViewController()
      vc.title = "Profile"
      let rightItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear_icon"), style: .plain, target: nil, action: nil)
      rightItem.tintColor = UIColor(.outerSpace)
      vc.navigationItem.rightBarButtonItem = rightItem
      
      vc.navigationItem.leftBarButtonItem = UIBarButtonItem()
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _profileVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
   }
}
