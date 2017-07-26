//
//  SignupViewController.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Elemental

class SignupViewController: ElementalViewController {
   var model: SignupConductionModel? {
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
      
      return Element.form([
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Email"),
         .verticalSpace(6),
         .textFieldInput(configuration: EmailInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Enter your email"),
                         bindings: [model.targetBinding(key: BindableElementKey.text,
                                                        targetKey: .email)]),
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Username"),
         .verticalSpace(6),
         .textFieldInput(configuration: UsernameInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Enter a username"),
                         bindings: [model.targetBinding(key: BindableElementKey.text,
                                                        targetKey: .username)]),
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Password"),
         .verticalSpace(6),
         .textFieldInput(configuration: PasswordInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Enter a password"),
                         bindings: [model.targetBinding(key: BindableElementKey.text,
                                                        targetKey: .password)]),
         .verticalSpace(24),
         .text(configuration: TextConfiguration(size: 14, weight:.book),
               content: "Confirm Password"),
         .verticalSpace(6),
         .textFieldInput(configuration: PasswordInputConfiguration(),
                         content: TextInputElementContent(name: "",
                                                          detail: nil,
                                                          placeholder: "Re-enter password"),
                         bindings: [model.targetBinding(key: BindableElementKey.text,
                                                        targetKey: .confirmedPassword)]),
      ])
   }
}
