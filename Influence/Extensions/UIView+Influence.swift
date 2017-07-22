//
//  UIView+Influence.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

extension UIView {
   func setShadow(color: UIColor = UIColor(.darkGray), opacity: Float = 0.2, xOffset: CGFloat = 0, yOffset: CGFloat = 0, radius: CGFloat = 20) {
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = CGSize(width: xOffset, height: yOffset)
      layer.shadowRadius = radius
      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
   }
}
