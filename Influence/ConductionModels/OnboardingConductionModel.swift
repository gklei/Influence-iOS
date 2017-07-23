//
//  OnboardingConductionModel.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction
import Bindable

struct OnboardingContent {
   let image: UIImage?
   let header: String?
   let text: String?
   
   init(image: UIImage?, header: String? = nil, text: String? = nil) {
      self.image = image
      self.header = header
      self.text = text
   }
   
   static func content(image: UIImage?, header: String? = nil, text: String? = nil) -> OnboardingContent {
      return OnboardingContent(image: image, header: header, text: text)
   }
}

enum OnboardingKey: String, IncKVKeyType {
   case isOnboardingFinished
}

struct OnboardingState: ConductionState {
   var signUpButtonText: String = "Sign Up"
}

protocol OnboardingConductionModelDelegate: class {
   func loginButtonPressed(model: OnboardingConductionModel)
   func signupButtonPressed(model: OnboardingConductionModel)
   func onboardingPageTransitionCompleted(index: Int, model: OnboardingConductionModel)
}

class OnboardingConductionModel: ReadWriteKeyedConductionModel<OnboardingKey, OnboardingState> {
   // MARK: - Public Properties
   let content: [OnboardingContent]
   weak var delegate: OnboardingConductionModelDelegate?
   
   var isOnboardingFinished: Bool {
      get { return value(for: .isOnboardingFinished) as! Bool }
      set { try! set(value: newValue, for: .isOnboardingFinished) }
   }
   
   // MARK: - Init
   init(content: [OnboardingContent]) {
      self.content = content
      super.init()
   }
   
   override func didSet(conductedValue: Any?, with value: inout Any?, for key: OnboardingKey) {
      guard let finished = self[.isOnboardingFinished] as? Bool else { fatalError() }
      state.signUpButtonText = finished ? "SIGN UP" : "NEXT"
   }
   
   // MARK: - Actions
   func loginButtonPressed() {
      delegate?.loginButtonPressed(model: self)
   }
   
   func signupButtonPressed() {
      delegate?.signupButtonPressed(model: self)
   }
   
   func onboardingPageTransitionCompleted(index: Int) {
      delegate?.onboardingPageTransitionCompleted(index: index, model: self)
   }
}
