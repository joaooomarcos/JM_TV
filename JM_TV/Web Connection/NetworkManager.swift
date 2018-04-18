//
//  NetworkManager.swift
//  JM_TV
//
//  Created by João Marcos on 16/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String: String]

class NetworkManager {
    
    func request<T: Decodable>(url: URL, method: HTTPMethod = .get, parameters: [String: Any] = [:], headers: HTTPHeaders = [:], completion: @escaping (_ result: Result<T>) -> Void) {
        
        let allParams = self.addDefaultParams(parameters)
        
        AlamofireRequestManager().request(url: url, method: method.toAlamofire(), parameters: allParams, headers: headers, completion: completion)
    }
    
    private func addDefaultParams(_ inParams: [String: Any]) -> [String: Any] {
        var params: [String: Any] = ["api_key": "d6390c4acae0196b3b9ff2e4cd6bb392",
                                     "language": Locale.languageAndRegion]
        
        params += inParams
        
        return params
    }

}
