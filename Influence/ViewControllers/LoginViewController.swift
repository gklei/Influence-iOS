//
//  LoginViewController.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Elemental

class LoginViewController: ElementalViewController {
   var model: APIAccount.Signin? {
      didSet {
         setNeedsReload()
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
   }
   
   override func formDidLoad() {
      super.formDidLoad()
      sidePadding = 14
   }
   
   override func generateElements() -> [Elemental]? {
      guard let model = model else { return nil }
      
      let headerStyle = ElementalTextStyle()
      headerStyle.font = UIFont(14, .bold)
      headerStyle.color = UIColor(.outerSpace)
      headerStyle.alignment = .left
      
      return Element.form([
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Username"),
         .verticalSpace(6),
         .textFieldInput(configuration: UsernameInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Enter your username"),
                         bindings: [model.targetBinding(key: BindableElementKey.text,
                                                        targetKey: .username)]),
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Password"),
         .verticalSpace(6),
         .textFieldInput(configuration: PasswordInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Enter your password"),
                         bindings: [model.targetBinding(key: BindableElementKey.text,
                                                        targetKey: .password)]),
      ])
   }
}
