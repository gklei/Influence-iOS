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
   fileprivate let _profileConductor = ProfileConductor()
   fileprivate let _leaderboardsConductor = LeaderboardsConductor()
   fileprivate let _rulesConductor = RulesConductor()
   
   fileprivate lazy var _childConductors: [TabConductor] = {
      return [self._profileConductor, self._leaderboardsConductor, self._rulesConductor]
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
         UIViewController(), UIViewController()
         ]
      )
      
      _tabController.tabBar.configureWithInfluenceUIDefaults()
      
      let normalAttrs: [String : Any] = [
         NSForegroundColorAttributeName : UIColor.white,
         NSFontAttributeName : UIFont(16, .book),
         NSKernAttributeName : 1.5
      ]
      
      let highlightedAttrs: [String : Any] = [
         NSForegroundColorAttributeName : UIColor(.red),
         NSFontAttributeName : UIFont(16, .bold),
         NSKernAttributeName : 1.5
      ]
      
      let button = UIButton(type: .custom)
      let normalAttrTitle = NSAttributedString(string: "SHARE!", attributes: normalAttrs)
      let highlightedTitle = NSAttributedString(string: "SHARE!", attributes: highlightedAttrs)
      
      button.setAttributedTitle(normalAttrTitle, for: .normal)
      button.setAttributedTitle(highlightedTitle, for: .highlighted)
      button.backgroundColor = UIColor(.outerSpace)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.tintColor = .white
      
      _tabController.view.addSubview(button)
      NSLayoutConstraint.activate([
         button.widthAnchor.constraint(equalTo: _tabController.view.widthAnchor, multiplier: 0.4),
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
