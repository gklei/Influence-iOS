//
//  OnboardingConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction

class OnboardingConductor: TabConductor {
   fileprivate lazy var _onboardingVC: OnboardingViewController = {
      let conductionModel = OnboardingConductionModel(content: [
         .content(image: nil,
                  header: "PYRAMID",
                  text: "Compete with your friends to see who can gather the most influence."),
         .content(image: #imageLiteral(resourceName: "share_onboarding_icon"),
                  header: "GET POINTS",
                  text: "Sign up as many friends as you can for points."),
         .content(image: #imageLiteral(resourceName: "graph_onboarding_icon"),
                  header: "GLOBAL RANKINGS",
                  text: "Leaderboards make it easy to see where you rank in your city, state, or just among your friends."),
         ])
      conductionModel.isOnboardingFinished = false
      conductionModel.delegate = self
      let vc = OnboardingViewController(conductionModel: conductionModel)
      
      vc.title = ""
      vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "user_icon"), selectedImage: #imageLiteral(resourceName: "user_icon_selected"))
      vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _onboardingVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
      context.navigationBar.shadowImage = UIImage()
   }
}

extension OnboardingConductor: OnboardingConductionModelDelegate {
   func loginButtonPressed(model: OnboardingConductionModel) {
   }
   
   func signupButtonPressed(model: OnboardingConductionModel) {
      if !model.isOnboardingFinished {
         _onboardingVC.advance()
      }
   }
   
   func onboardingPageTransitionCompleted(index: Int, model: OnboardingConductionModel) {
      print("index: \(index)")
      _onboardingVC.conductionModel.isOnboardingFinished = index == 2
   }
}

extension OnboardingConductor: OnboardingPageViewControllerDelegate {
   func onboardingPageTransitionCompleted( index: Int, in viewController: OnboardingPageViewController) {
   }
}
