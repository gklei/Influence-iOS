//
//  RulesViewController.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Elemental

class RulesViewController: ElementalViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
   }
   
   override func formDidLoad() {
      super.formDidLoad()
      sidePadding = 14
   }
   
   override func generateElements() -> [Elemental]? {
      let headerStyle = ElementalTextStyle()
      headerStyle.font = UIFont(16, .book)
      headerStyle.color = UIColor(.outerSpace)
      
      let bodyStyle = ElementalTextStyle()
      bodyStyle.font = UIFont(14, .light)
      bodyStyle.color = UIColor(.outerSpace, alpha: 0.8)
      
      return Element.form([
         .verticalSpace(24),
         .text(configuration: TextElementConfiguration(textStyle: headerStyle),
               content: "POINTS"),
         .verticalSpace(12),
         .text(configuration: TextElementConfiguration(textStyle: bodyStyle),
               content: "Share the app with as many people as possible and increase your influencing power. Here's how points work:")
         ])
   }
}
