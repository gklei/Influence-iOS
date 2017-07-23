//
//  LoginViewController.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Elemental

class LoginViewController: ElementalViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
   }
   
   override func generateElements() -> [Elemental]? {
      let headerStyle = ElementalTextStyle()
      headerStyle.font = UIFont(14, .bold)
      headerStyle.color = UIColor(.outerSpace)
      headerStyle.alignment = .left
      
      return Element.form([
         .verticalSpace(24),
         .text(configuration: TextElementConfiguration(textStyle: headerStyle),
               content: "EMAIL")
         ])
   }
}
