//
//  AlamofireRequestManager.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Alamofire

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
