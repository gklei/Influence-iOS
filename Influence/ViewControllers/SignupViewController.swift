//
//  SignupViewController.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Elemental

class SignupViewController: ElementalViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
   }
   
   override func formDidLoad() {
      super.formDidLoad()
      sidePadding = 14
   }
   
   override func generateElements() -> [Elemental]? {
      return Element.form([
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Email"),
         .verticalSpace(6),
         .textFieldInput(configuration: TextInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Enter your email")),
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Username"),
         .verticalSpace(6),
         .textFieldInput(configuration: TextInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Enter a username")),
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Password"),
         .verticalSpace(6),
         .textFieldInput(configuration: TextInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Enter a password")),
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Confirm Password"),
         .verticalSpace(6),
         .textFieldInput(configuration: TextInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Re-enter password")),
      ])
   }
}
