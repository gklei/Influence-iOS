//
//  WelcomeConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class WelcomeConductor: Conductor {
   fileprivate lazy var _welcomeVC: ViewController = {
      let vc = ViewController()
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _welcomeVC
   }
}
