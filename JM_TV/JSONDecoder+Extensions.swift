//
//  JSONDecoder+Extensions.swift
//  JM_TV
//
//  Created by João Marcos on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T>(_ type: T.Type, fromDict dict: [AnyHashable: Any]) throws -> T where T: Decodable {
        let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        return try self.decode(type, from: data)
    }
}
