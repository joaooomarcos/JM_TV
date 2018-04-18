//
//  Movie.swift
//  JM_TV
//
//  Created by João Marcos on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

class Movie: Decodable {
    
    var id: Int?
    var title: String?
    var posterPath: String?
    var synopsis: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case synopsis = "overview"
    }
}
