//
//  SignupConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction
import IncNetworkLayer

class SignupConductor: Conductor {
   fileprivate lazy var _signupVC: SignupViewController = {
      let vc = SignupViewController()
      vc.title = "Sign Up"
      vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "user_icon"), selectedImage: #imageLiteral(resourceName: "user_icon_selected"))
      vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
      
      let item = UIBarButtonItem(image: #imageLiteral(resourceName: "right_arrow_icon"),
                                 style: .plain,
                                 target: self,
                                 action: #selector(SignupConductor._continueItemPressed))
      item.tintColor = UIColor(.outerSpace)
      vc.navigationItem.rightBarButtonItem = item
      
      let backItem = UIBarButtonItem(image: #imageLiteral(resourceName: "left_arrow_icon"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(Conductor.dismiss))
      backItem.tintColor = UIColor(.outerSpace)
      vc.navigationItem.leftBarButtonItem = backItem
      
      return vc
   }()
   
   override var rootViewController: UIViewController? {
      return _signupVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
      
      let conductionModel = SignupConductionModel()
      conductionModel.delegate = self
      conductionModel.addStateObserver { old, new in
         self._signupVC.navigationItem.rightBarButtonItem?.isEnabled = new.isContinueButtonEnabled
      }
      
      _signupVC.model = conductionModel
   }
   
   @objc private func _continueItemPressed() {
      _signupVC.model?.continueButtonPressed()
   }
}

extension SignupConductor: SignupConductionModelDelegate {
   func continueButtonPressed(model: SignupConductionModel) {
      var apiInput = APIAccount.Signup()
      try! model.sync(model: &apiInput)
      
      let request = SignupRequest(parameter: apiInput)
      let signupOp = SignupOperation(request: request)
      signupOp.completion = { result in
         switch result {
         case .success(let account): dump(account)
         case .error(let error): print("Error signing up: \(error.localizedDescription)")
         }
         model.signupOperationFinished()
      }
      
      model.signupOperationStarted()
      IncNetworkQueue.shared.addOperation(signupOp)
   }
}
