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
      
      
      let loginSelector = #selector(SignupConductor._signupItemPressed)
      let item = UIBarButtonItem(image: #imageLiteral(resourceName: "right_arrow_icon"),
                                 style: .plain,
                                 target: self,
                                 action: loginSelector)
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
   
   fileprivate var _signupModel: APIAccount.Signup?
   
   override var rootViewController: UIViewController? {
      return _signupVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
      
      _signupModel = APIAccount.Signup()
      _signupModel?.username = "dr_schreber"
      _signupModel?.email = "gklei89@gmail.com"
      _signupModel?.password = "test1234"
      _signupModel?.confirmedPassword = "test1234"
      _signupVC.model = _signupModel
   }
   
   @objc private func _signupItemPressed() {
      guard let parameter = _signupModel else { fatalError() }
      let request = SignupRequest(parameter: parameter)
      let signinOp = SignupOperation(request: request)
      signinOp.completion = { result in
         switch result {
         case .success(let account): dump(account)
         case .error(let error): print("Error signing up: \(error.localizedDescription)")
         }
      }
      
      print("Signing up...")
      IncNetworkQueue.shared.addOperation(signinOp)
   }
}
