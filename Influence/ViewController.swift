//
//  ViewController.swift
//  Influence
//
//  Created by Gregory Klein on 7/20/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit
import Elemental

class ViewController: ElementalViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
   }
   
   override func generateElements() -> [Elemental]? {
      let style = ElementalTextStyle()
      style.font = UIFont.preferredFont(forTextStyle: .title1)
      style.alignment = .center
      style.color = .darkGray
      
      return Element.form([
         .verticalSpace(24),
         .text(configuration: TextElementConfiguration(textStyle: style),
               content: "INFLUENCE")
         ])
   }
}

