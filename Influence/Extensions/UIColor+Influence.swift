//
//  UIColor+Influence.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

enum Color: String {
   case mint, spearmint, lime, lipstick, darkGray, lightGray, outerSpace, white, red
   
   var hex: String {
      switch self {
      case .mint: return "3EF4BC"
      case .spearmint: return "95FFDF"
      case .lime: return "60F4F0"
      case .lipstick: return "F43252"
      case .darkGray: return "515151"
      case .lightGray: return "727272"
      case .outerSpace: return "242F41"
      case .white: return "FFFFFF"
      case .red: return "AB4174"
      }
   }
}

extension UIColor {
   convenience init(_ color: Color, alpha: CGFloat? = 1) {
      self.init(hex: color.hex, alpha: alpha)
   }
   
   convenience init(hex: String, alpha: CGFloat? = 1) {
      let hex = hex.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
      var int = UInt32()
      Scanner(string: hex).scanHexInt32(&int)
      let a, r, g, b: UInt32
      switch hex.characters.count {
      case 3: // RGB (12-bit)
         (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
      case 6: // RGB (24-bit)
         (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
      case 8: // ARGB (32-bit)
         (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
      default:
         (a, r, g, b) = (1, 1, 1, 0)
      }
      
      let alpha = alpha ?? CGFloat(a) / 255
      self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: alpha)
   }
}
