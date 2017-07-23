//
//  OnboardingViewController.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Elemental

class OnboardingViewController: ElementalViewController {
   // MARK: - Private Properties
   fileprivate let _onboardingPageVC: OnboardingPageViewController
   fileprivate(set) var conductionModel: OnboardingConductionModel
   
   fileprivate lazy var _signupButton: UIButton = {
      let button = UIButton(title: "SIGN UP",
                            fontWeight: .light,
                            titleColor: UIColor(.white),
                            backgroundColor: UIColor(.outerSpace),
                            highlightedBackgroundColor: UIColor(.red))
      button.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 24, height: 48)
      button.addTarget(self, action: #selector(OnboardingViewController.signupButtonPressed(sender:)), for: .touchUpInside)
      return button
   }()
   
   fileprivate lazy var _loginButton: UIButton = {
      let button = UIButton(title: "LOG IN", font: UIFont(14, .light), tintColor: UIColor(.outerSpace))
      button.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 24, height: 48)
      return button
   }()
   
   // MARK: - Init
   init(conductionModel: OnboardingConductionModel) {
      self.conductionModel = conductionModel
      _onboardingPageVC = OnboardingPageViewController(content: conductionModel.content)
      super.init(nibName: nil, bundle: nil)
      
      _onboardingPageVC.onboardingDelegate = self
      self.conductionModel.addStateObserver { [weak self] old, new in
         self?._signupButton.setTitle(new.signUpButtonText, for: .normal)
      }
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
   }
   override func formDidLoad() {
      super.formDidLoad()
      sidePadding = 0.0
   }
   
   override func generateElements() -> [Elemental]? {
      return Element.form([
         .viewController(_onboardingPageVC, sizeConstraint: ElementalSize(height: .multiplier(0.8))),
         .view(_signupButton),
         .verticalSpace(4),
         .view(_loginButton),
         ]
      )
   }
   
   func advance() {
      _onboardingPageVC.navigate(.forward)
   }
   
   @objc fileprivate func signupButtonPressed(sender: UIButton) {
      conductionModel.signupButtonPressed()
   }
}

extension OnboardingViewController: OnboardingPageViewControllerDelegate {
   func onboardingPageTransitionCompleted(index: Int, in viewController: OnboardingPageViewController) {
      conductionModel.onboardingPageTransitionCompleted(index: index)
   }
}
