//
//  UINavigationBar+Influence.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

extension UINavigationBar {
   func configureWithInfluenceDefaults() {
      shadowImage = UIImage.with(color: .outerSpace)
//      setShadow(opacity: 0.1, yOffset: -2, radius: 20)
      setBackgroundImage(UIImage.with(color: .white), for: .default)
      titleTextAttributes = [
         NSForegroundColorAttributeName : UIColor(.outerSpace),
         NSFontAttributeName : UIFont(16, .book),
         NSKernAttributeName : 1.5
      ]
   }
}
