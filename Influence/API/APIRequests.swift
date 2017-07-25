//
//  APIRequests.swift
//  REACH
//
//  Created by Gregory Klein on 7/25/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Foundation
import Bindable
import IncNetworkLayer

fileprivate let kHeaderAPIKey = "adf4JLSD123jlkjSDkfj25Dfo2i23j4LKS789JDFz"
protocol APIResponseInitable: IncNetworkJSONInitable, IncKVJSONInitableClass {}

class APIBaseRequest: IncNetworkJSONRequest {
   // MARK: - IncNetworkJSONFormRequest
   var query: String? { return nil }
   var body: Data? { return nil }
   var headers: [String : String]? {
      var updatedHeaders = defaultJSONHeaders()
      updatedHeaders["x-reach-api-key"] = kHeaderAPIKey
      return updatedHeaders
   }
   
   var endpoint: String { return "" }
   var method: IncNetworkService.Method { return .post }
   
   func decode(data: Data?, response: URLResponse?) throws -> Any? {
      guard let data = data, !data.isEmpty else { return nil }
      let json = try JSONSerialization.jsonObject(with: data, options: [])
      return json
   }
}

class APIRequest<Parameter: IncNetworkJSONRepresentable>: APIBaseRequest, IncNetworkJSONParameterRequest {
   var parameter: Parameter? = nil
   override var body: Data? {
      return body(with: parameter?.jsonRepresentation)
   }
   
   init(parameter: Parameter) {
      self.parameter = parameter
      super.init()
   }
}
