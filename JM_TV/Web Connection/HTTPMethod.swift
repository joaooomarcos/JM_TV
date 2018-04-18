//
//  HTTPMethod.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Alamofire

enum HTTPMethod {
    
    case get
    case post
    
    func toAlamofire() -> Alamofire.HTTPMethod {
        switch self {
        case .get:
            return Alamofire.HTTPMethod.get
        case .post:
            return Alamofire.HTTPMethod.post
        }
    }
}
