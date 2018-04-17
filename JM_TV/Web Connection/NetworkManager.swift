//
//  NetworkManager.swift
//  JM_TV
//
//  Created by João Marcos on 16/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Alamofire
import Foundation

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure

    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .invalidData:
            return "Invalid Data"
        case .responseUnsuccessful:
            return "Response Unsuccessful"
        case .jsonParsingFailure:
            return "JSON Parsing Failure"
        case .jsonConversionFailure:
            return "JSON Conversion Failure"
        }
    }
}

enum HTTPMethod {
    case get

    func toAlamofire() -> Alamofire.HTTPMethod {
        switch self {
        case .get:
            return Alamofire.HTTPMethod.get
        }
    }
}

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

class AlamofireRequestManager {
    
    private var manager: Alamofire.SessionManager
    
    init(manager: Alamofire.SessionManager = Alamofire.SessionManager.default) {
        self.manager = manager
    }

    func request<T: Decodable>(url: URL, method: Alamofire.HTTPMethod, parameters: [String: Any], headers: HTTPHeaders, completion: @escaping (_ result: Result<T>) -> Void) {
        
        let encoding: ParameterEncoding = method == .get ? URLEncoding.queryString : JSONEncoding.default
        
        self.manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        .validate()
        .responseJSON { response in
                switch response.result {
                case .success(let resValue):
                    if let resDic = resValue as? [String: Any] {
                        let decoder = JSONDecoder()
                        do {
                            let object = try decoder.decode(T.self, fromDict: resDic)
                            completion(.success(object))
                        } catch {
                            completion(.error(APIError.invalidData))
                        }
                        
                    }
                case .failure(let error):
                    completion(.error(error))
                }
        }
    }
}
