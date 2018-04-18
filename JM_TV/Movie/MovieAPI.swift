//
//  MovieAPI.swift
//  JM_TV
//
//  Created by João Marcos on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

class MovieAPI {
    static func getNowPlaying(completion: @escaping (Result<Page<Movie>>) -> Void) {
        NetworkManager().request(url: MovieEndpoint.nowPlaying.url, completion: completion)
    }
    
    static func getUpcoming(completion: @escaping (Result<Page<Movie>>) -> Void) {
        NetworkManager().request(url: MovieEndpoint.upcoming.url, completion: completion)
    }
    
    static func getTopRated(completion: @escaping (Result<Page<Movie>>) -> Void) {
        NetworkManager().request(url: MovieEndpoint.topRated.url, completion: completion)
    }
}
