//
//  DetailMenuLabel.swift
//  Influence
//
//  Created by Gregory Klein on 7/21/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit

final class DetailMenuLabel: UILabel {
   let detailText: String
   
   // MARK: - Init
   init(detailText: String) {
      self.detailText = detailText
      super.init(frame: .zero)
      
      isUserInteractionEnabled = true
      
      let longPress = UILongPressGestureRecognizer(target: self, action: #selector(DetailMenuLabel.showMenu(recognizer:)))
      addGestureRecognizer(longPress)
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override var canBecomeFirstResponder: Bool { return true }
   
   func showMenu(recognizer: UIGestureRecognizer) {
      guard recognizer.state == .began else { return }
      
      becomeFirstResponder()
      
      let menu = UIMenuController.shared
      menu.menuItems =  [UIMenuItem(title: detailText, action: #selector(DetailMenuLabel._detailMenuLabelPressed))]
      menu.setTargetRect(bounds, in: self)
      menu.setMenuVisible(true, animated: true)
   }
   
   @objc private func _detailMenuLabelPressed() {
      print("menu item pressed")
   }
}
