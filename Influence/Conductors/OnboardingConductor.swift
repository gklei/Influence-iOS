//
//  OnboardingConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class OnboardingConductor: TabConductor {
   fileprivate lazy var _onboardingContent: [OnboardingContent] = {
      return [
         .content(image: #imageLiteral(resourceName: "triangle_icon"),
                  header: "REACH",
                  text: "Compete with your friends to see who can gather the most influence."),
         .content(image: #imageLiteral(resourceName: "share_onboarding_icon"),
                  header: "Get Points",
                  text: "Sign up as many friends as you can for points."),
         .content(image: #imageLiteral(resourceName: "graph_onboarding_icon"),
                  header: "Global Rankings",
                  text: "Leaderboards make it easy to see where you rank in your city, state, or just among your friends."),
         ]
   }()
   
   fileprivate lazy var _onboardingVC: OnboardingViewController = {
      let conductionModel = OnboardingConductionModel(content: self._onboardingContent)
      conductionModel.isOnboardingFinished = false
      conductionModel.delegate = self
      let vc = OnboardingViewController(conductionModel: conductionModel)
      
      vc.title = ""
      vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "user_icon"), selectedImage: #imageLiteral(resourceName: "user_icon_selected"))
      vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
      return vc
   }()
   
   fileprivate let _loginConductor = LoginConductor()
   fileprivate let _signupConductor = SignupConductor()
   
   override var rootViewController: UIViewController? {
      return _onboardingVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
   }
}

extension OnboardingConductor: OnboardingConductionModelDelegate {
   func loginButtonPressed(model: OnboardingConductionModel) {
      guard let context = context else { return }
      _loginConductor.show(with: context, animated: true)
   }
   
   func signupButtonPressed(model: OnboardingConductionModel) {
      if !model.isOnboardingFinished {
         _onboardingVC.advance()
      } else {
         guard let context = context else { return }
         _signupConductor.show(with: context, animated: true)
      }
   }
   
   func onboardingPageTransitionCompleted(index: Int, model: OnboardingConductionModel) {
      _onboardingVC.conductionModel.isOnboardingFinished = index == _onboardingContent.count - 1
   }
}

extension OnboardingConductor: OnboardingPageViewControllerDelegate {
   func onboardingPageTransitionCompleted( index: Int, in viewController: OnboardingPageViewController) {
   }
}
