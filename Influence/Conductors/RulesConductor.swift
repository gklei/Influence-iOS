//
//  RulesConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class RulesConductor: TabConductor {
   fileprivate lazy var _rulesVC: RulesViewController = {
      let vc = RulesViewController()
      vc.title = "RULES"
      vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "pie_chart_icon"), selectedImage: #imageLiteral(resourceName: "pie_chart_icon_selected"))
      vc.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _rulesVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
   }
}
