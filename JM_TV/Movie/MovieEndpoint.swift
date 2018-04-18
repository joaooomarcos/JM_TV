//
//  MovieEndpoints.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

enum MovieEndpoint {
    case detail(Int)
    case nowPlaying
    case topRated
    case upcoming
}

extension MovieEndpoint: Endpoint {
    var path: String {
        switch self {
        case .detail(let id):
            return "3/movie/\(id)"
        case .nowPlaying:
            return "3/movie/now_playing"
        case .topRated:
            return "3/movie/top_rated"
        case .upcoming:
            return "3/movie/upcoming"
        }
    }
}
