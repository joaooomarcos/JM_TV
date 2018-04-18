//
//  Page.swift
//  JM_TV
//
//  Created by João Marcos on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

class Page<T: Decodable>: Decodable {
    
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [T]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
