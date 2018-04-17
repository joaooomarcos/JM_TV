//
//  APIEndpoints.swift
//  JM_TV
//
//  Created by João Marcos on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var url: URL { get }
}

extension Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var url: URL {
        if var urlBase = URL(string: self.base) {
            urlBase.appendPathComponent(self.path)
            return urlBase
        }
        
        fatalError()
    }
}

enum MovieEndpoint {
    case detail(Int)
}

extension MovieEndpoint: Endpoint {
    var path: String {
        switch self {
        case .detail(let id):
            return "3/movie/\(id)"
        }
    }
}
