//
//  SignupRequest.swift
//  REACH
//
//  Created by Gregory Klein on 7/25/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Foundation
import IncNetworkLayer
import Bindable

protocol APIParameterType: IncNetworkJSONRepresentable, IncKVJSONRepresentable {}

// MARK: - Model
final class APIAccount: APIResponseInitable {
   var email: String?
   var username: String?
   
   enum Key: String, IncKVKeyType {
      case email
      case username
   }
   
   func value(for key: APIAccount.Key) -> Any? {
      switch key {
      case .email: return email
      case .username: return username
      }
   }
   
   func set(value: Any?, for key: APIAccount.Key) throws {
      switch key {
      case .email: email  = value as? String
      case .username: username  = value as? String
      }
   }
   
   final class Signup: Bindable, APIParameterType {
      enum Key: String, IncKVKeyType {
         case username, email, password, confirmedPassword
      }
      
      var username: String?
      var email: String?
      var password: String?
      var confirmedPassword: String?
      
      // MARK: - Bindable
      var keysBeingSet: [Key] = []
      var bindingBlocks: [Key : [((targetObject: AnyObject, rawTargetKey: String)?, Any?) throws -> Bool?]] = [:]
      
      func value(for key: Key) -> Any? {
         switch key {
         case .username: return username
         case .email: return email
         case .password: return password
         case .confirmedPassword: return confirmedPassword
         }
      }
      
      func setOwn(value: inout Any?, for key: Key) throws {
         switch key {
         case .username: username = value as? String
         case .email: email = value as? String
         case .password: password = value as? String
         case .confirmedPassword: confirmedPassword = value as? String
         }
      }
   }
   
   final class Signin: Bindable, APIParameterType {
      enum Key: String, IncKVKeyType {
         case username, password
      }
      
      var username: String?
      var password: String?
      
      // MARK: - Bindable
      var keysBeingSet: [Key] = []
      var bindingBlocks: [Key : [((targetObject: AnyObject, rawTargetKey: String)?, Any?) throws -> Bool?]] = [:]
      
      func value(for key: Key) -> Any? {
         switch key {
         case .username: return username
         case .password: return password
         }
      }
      
      func setOwn(value: inout Any?, for key: Key) throws {
         switch key {
         case .username: username = value as? String
         case .password: password = value as? String
         }
      }
   }
}

class SignupRequest: APIRequest<APIAccount.Signup> {
   override var endpoint: String { return "auth/signup" }
}

class SigninRequest: APIRequest<APIAccount.Signin> {
   override var endpoint: String { return "auth/signin" }
}

class APIBaseOperation<SuccessMapper: IncNetworkMapper, ErrorMapper: IncNetworkMapper>: IncNetworkPassFailOperation<SuccessMapper, ErrorMapper> {}
class APIOperation<SuccessType: APIResponseInitable>: APIBaseOperation<IncNetworkJSONMapper<SuccessType>, IncNetworkNilMapper> {}

class SignupOperation: APIOperation<APIAccount> {
}

class SigninOperation: APIOperation<APIAccount> {
}
