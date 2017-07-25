//
//  LoginConductor.swift
//  Influence
//
//  Created by Gregory Klein on 7/22/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Conduction
import IncNetworkLayer

class LoginConductor: Conductor {
   fileprivate lazy var _loginVC: LoginViewController = {
      let vc = LoginViewController()
      vc.title = "Log In"
      vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "user_icon"), selectedImage: #imageLiteral(resourceName: "user_icon_selected"))
      vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
      
      let loginSelector = #selector(LoginConductor._loginItemPressed)
      vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue",
                                                             style: .plain,
                                                             target: self,
                                                             action: loginSelector)
      return vc
   }()
   
   fileprivate var _signinModel: APIAccount.Signin?
   
   override var rootViewController: UIViewController? {
      return _loginVC
   }
   
   override func conductorWillShow(in context: UINavigationController) {
      context.navigationBar.configureWithInfluenceDefaults()
      
      _signinModel = APIAccount.Signin()
      _signinModel?.username = "gkl3i8"
      _signinModel?.password = "a"
      _loginVC.model = _signinModel
   }
   
   @objc private func _loginItemPressed() {
      guard let parameter = _signinModel else { fatalError() }
      let request = SigninRequest(parameter: parameter)
      let signinOp = SigninOperation(request: request)
      signinOp.completion = { result in
         switch result {
         case .success(let account): dump(account)
         case .error(let error): print("Error signing in: \(error.localizedDescription)")
         }
      }
      
      print("Signing in...")
      IncNetworkQueue.shared.addOperation(signinOp)
   }
}
