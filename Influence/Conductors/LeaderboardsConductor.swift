//
//  LeaderboardsConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/21/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class LeaderboardsConductor: TabConductor {
   fileprivate lazy var _leaderboardVC: LeaderboardViewController = {
      let vc = LeaderboardViewController()
      vc.title = "Leaderboards"
      vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "leaderboards_icon"), selectedImage: #imageLiteral(resourceName: "leaderboards_icon_selected"))
      vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _leaderboardVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
   }
}
