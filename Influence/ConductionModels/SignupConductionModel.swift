//
//  SignupConductionModel.swift
//  REACH
//
//  Created by Gregory Klein on 7/26/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import UIKit
import Conduction

struct SignupState: ConductionState {
   var isContinueButtonEnabled = false
   var isShowingActivityIndicator = false
   var passwordsMatchText: String?
}

protocol SignupConductionModelDelegate: class {
   func continueButtonPressed(model: SignupConductionModel)
}

class SignupConductionModel: KeyedConductionModel<APIAccount.Signup.Key, SignupState> {
   override var viewReadWriteKeys: [Key] { return Key.all }
   override var modelWriteOnlyKeys: [Key] {
      return [.username, .email, .password]
   }
   
   weak var delegate: SignupConductionModelDelegate?
   
   // MARK: - ConductionModel Subclass Hooks
   override func set(conductedValue value: Any?, for key: Key) throws -> Any? {
      switch key {
      case .username, .email: return (value as? String)?.trimmed == "" ? nil : value
      case .password, .confirmedPassword: return (value as? String) == "" ? nil : value
      }
   }
   
   override func didSet(conductedValue: Any?, with value: inout Any?, for key: Key) {
      state.update { state in
         state.passwordsMatchText = self._passwordsMatch() ? nil : "Passwords do not match"
         state.isContinueButtonEnabled = self._passwordsMatch() && self[.username] != nil && self[.email] != nil
      }
   }
   
   // MARK: - Private
   fileprivate func _passwordsMatch() -> Bool {
      let p1: String = cast(key: .password, default: "")
      let p2: String = cast(key: .confirmedPassword, default: "")
      return p1 == p2
   }
   
   // MARK: - Public
   func continueButtonPressed() {
      delegate?.continueButtonPressed(model: self)
   }
   
   func signupOperationStarted() {
      state.isShowingActivityIndicator = true
   }
   
   func signupOperationFinished() {
      state.isShowingActivityIndicator = false
   }
}
