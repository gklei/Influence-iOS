//
//  MainConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/21/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction
import UIKit

class MainConductor: Conductor {
   fileprivate let _tabController = UITabBarController()
   fileprivate let _onboardingConductor = OnboardingConductor()
   fileprivate let _leaderboardsConductor = LeaderboardsConductor()
   
   fileprivate lazy var _childConductors: [TabConductor] = {
      return [self._onboardingConductor, self._leaderboardsConductor]
   }()
   
   override var rootViewController: UIViewController? {
      return _tabController
   }
   
   override init() {
      super.init()
      _childConductors.forEach {
         $0.show(in: self._tabController, with: UINavigationController())
      }
      
      _tabController.viewControllers?.append(contentsOf: [
         UIViewController()
         ]
      )
      
      _tabController.tabBar.configureWithInfluenceUIDefaults()
      
      let button = UIButton(type: .system)
      button.setImage(#imageLiteral(resourceName: "share_icon_solid"), for: .normal)
      button.backgroundColor = UIColor(.outerSpace)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.tintColor = .white
      
      _tabController.view.addSubview(button)
      NSLayoutConstraint.activate([
         button.widthAnchor.constraint(equalTo: _tabController.view.widthAnchor, multiplier: 0.33333),
         button.heightAnchor.constraint(equalToConstant: _tabController.tabBar.frame.height),
         button.trailingAnchor.constraint(equalTo: _tabController.view.trailingAnchor),
         button.bottomAnchor.constraint(equalTo: _tabController.view.bottomAnchor)
         ])
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.setNavigationBarHidden(true, animated: true)
   }
   
   override func conductorWillDismiss(from context: UINavigationController) {
      context.setNavigationBarHidden(false, animated: true)
   }
}
