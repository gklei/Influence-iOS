//
//  UIBarButtonItem+Extensions.swift
//  REACH
//
//  Created by Gregory Klein on 7/25/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

fileprivate let kButtonImageSpacing: CGFloat = 8

extension UIBarButtonItem {
   convenience init(title: String, titleSize: CGFloat = 14, icon: UIImage? = nil, tintColor: UIColor = UIColor(.outerSpace), target: Any? = nil, selector: Selector, rightToLeft: Bool = false) {
      let button = UIButton(type: .system)
      button.setTitle(title, for: .normal)
      button.titleLabel?.font = UIFont(titleSize, .medium)
      
      button.setImage(icon, for: .normal)
      button.tintColor = tintColor
      
      button.sizeToFit()
      button.frame.size.height = 44
      
      let spacing = title.isEmpty ? 0 : kButtonImageSpacing
      let edgeInset: CGFloat = icon != nil ? (rightToLeft ? -spacing : spacing) : 0.0
      button.titleEdgeInsets = UIEdgeInsets(top: 0, left: edgeInset, bottom: 0, right: -edgeInset)
      button.addTarget(target, action: selector, for: .touchUpInside)
      
      let containerFrame = CGRect(x: 0, y: 0, width: button.frame.width + abs(edgeInset), height: button.frame.height)
      let container = UIView(frame: containerFrame)
      container.addSubview(button)
      
      if rightToLeft {
         button.semanticContentAttribute = .forceRightToLeft
         button.frame = button.frame.offsetBy(dx: abs(edgeInset), dy: 0)
      }
      
      self.init(customView: container)
   }
}
