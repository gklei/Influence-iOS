//
//  UITabBar+Influence.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

extension UITabBar {
   func configureWithInfluenceUIDefaults() {
      unselectedItemTintColor = UIColor(.outerSpace)
      tintColor = UIColor(.red)
      isTranslucent = false
      shadowImage = UIImage()
      backgroundImage = UIImage.with(color: .white)
      setShadow(opacity: 0.1, xOffset: 0, yOffset: 2, radius: 20)
   }
}
