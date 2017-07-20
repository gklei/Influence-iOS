//
//  UIFont+Influence.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

enum FontWeight: String {
   case light = "Light", medium = "Medium", bold = "Bold", book = "Book"
}

extension UIFont {
   convenience init(_ size: CGFloat, _ weight: FontWeight) {
      self.init(name: "GothamSSm-\(weight.rawValue)", size: size)!
   }
}
