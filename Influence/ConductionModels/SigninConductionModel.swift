//
//  SigninConductionModel.swift
//  REACH
//
//  Created by Gregory Klein on 7/26/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

struct SigninState: ConductionState {
   var isContinueButtonEnabled = false
   var isShowingActivityIndicator = false
}

protocol SigninConductionModelDelegate: class {
   func continueButtonPressed(model: SigninConductionModel)
}

class SigninConductionModel: KeyedConductionModel<APIAccount.Signin.Key, SigninState> {
   override var viewReadWriteKeys: [Key] { return Key.all }
   override var modelWriteOnlyKeys: [Key] {
      return [.username, .password]
   }
   
   weak var delegate: SigninConductionModelDelegate?
   
   // MARK: - ConductionModel Subclass Hooks
   override func set(conductedValue value: Any?, for key: Key) throws -> Any? {
      switch key {
      case .username: return (value as? String)?.trimmed == "" ? nil : value
      case .password: return (value as? String) == "" ? nil : value
      }
   }
   
   override func didSet(conductedValue: Any?, with value: inout Any?, for key: Key) {
      state.isContinueButtonEnabled = self[.username] != nil && self[.password] != nil
   }
   
   func continueButtonPressed() {
      delegate?.continueButtonPressed(model: self)
   }
   
   func signupOperationStarted() {
      state.update { state in
         state.isShowingActivityIndicator = true
         state.isContinueButtonEnabled = false
      }
   }
   
   func signupOperationFinished() {
      state.update { state in
         state.isShowingActivityIndicator = false
         state.isContinueButtonEnabled = true
      }
   }
}

