//
//  UIButton+Influence.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

extension UIButton {
   convenience init(title: String?, font: UIFont, tintColor: UIColor) {
      self.init(type: .system)
      setTitle(title, for: .normal)
      titleLabel?.font = font
      self.tintColor = tintColor
   }
   
   convenience init(title: String?,
                    fontSize: CGFloat = 14,
                    fontWeight: FontWeight = .medium,
                    titleColor: Color = .outerSpace,
                    highlightedTitleColor: Color? = nil,
                    backgroundColor: Color = .mint,
                    highlightedBackgroundColor: Color? = nil) {
      
      let hTitleColor: UIColor? = highlightedBackgroundColor != nil ? UIColor(highlightedTitleColor!) : nil
      let hBackgroundColor: UIColor? = highlightedBackgroundColor != nil ? UIColor(highlightedBackgroundColor!) : nil
      self.init(title: title,
                fontSize: fontSize,
                fontWeight: fontWeight,
                titleColor: UIColor(titleColor),
                highlightedTitleColor: hTitleColor,
                backgroundColor: UIColor(backgroundColor),
                highlightedBackgroundColor: hBackgroundColor)
   }
   
   convenience init(title: String?,
                    fontSize: CGFloat = 14,
                    fontWeight: FontWeight = .medium,
                    titleColor: UIColor = .black,
                    highlightedTitleColor: UIColor? = nil,
                    backgroundColor: UIColor = .clear,
                    highlightedBackgroundColor: UIColor? = nil) {
      self.init(type: .custom)
      setTitle(title, for: .normal)
      setTitleColor(titleColor, for: .normal)
      setBackgroundImage(UIImage.with(color: backgroundColor), for: .normal)
      
      let hTitleColor: UIColor = highlightedTitleColor != nil ? highlightedTitleColor! : titleColor.withAlphaComponent(0.5)
      setTitleColor(hTitleColor, for: [.highlighted, .disabled])
      
      let hBackgroundColor: UIColor = highlightedBackgroundColor != nil ? highlightedBackgroundColor! : backgroundColor.withAlphaComponent(0.7)
      setBackgroundImage(UIImage.with(color: hBackgroundColor), for: .highlighted)
      setBackgroundImage(UIImage.with(color: backgroundColor.withAlphaComponent(0.6)), for: .disabled)
      
      titleLabel?.font = UIFont(fontSize, fontWeight)
      tintColor = titleColor
      layer.masksToBounds = true
   }
}
