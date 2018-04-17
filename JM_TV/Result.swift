//
//  Result.swift
//  JM_TV
//
//  Created by João Marcos on 16/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

enum Result<T> {
    case success(T)
    case error(Error)
}

extension Result {
    func map<U>(_ block: (T) throws -> U) -> Result<U> {
        switch self {
        case .success(let object):
            do {
                let newObject = try block(object)
                return .success(newObject)
            } catch let error {
                return .error(error)
            }
           
        case .error(let error):
            return .error(error)
        }
    }
}
