//
//  MovieViewModel.swift
//  JM_TV
//
//  Created by João Marcos on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Foundation

enum FilterType: Int {
    case nowPlaying = 0
    case upcoming
    case topRated
}

class MovieViewModel {
    
    private let movie: Movie
    
    init(_ movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var synopsis: String {
        return movie.synopsis ?? ""
    }
    
    var coverParh: URL {
        let path = movie.posterPath ?? ""
        return ImageEndpoint(.original, path).url
    }
    
    static func getMovies(with filter: FilterType, completion: @escaping (_ movies: [MovieViewModel]) -> Void) {
        switch filter {
        case .nowPlaying:
            return self.getNowPlaying(completion: completion)
        case .upcoming:
            return self.getUpcoming(completion: completion)
        case .topRated:
            return self.getTopRated(completion: completion)
        }
    }
    
    static func getNowPlaying(completion: @escaping (_ movies: [MovieViewModel]) -> Void) {
        MovieAPI.getNowPlaying { result in
            prepareCompletion(result: result, completion: completion)
        }
    }
    
    static func getUpcoming(completion: @escaping (_ movies: [MovieViewModel]) -> Void) {
        MovieAPI.getUpcoming { result in
            prepareCompletion(result: result, completion: completion)
        }
    }
    
    static func getTopRated(completion: @escaping (_ movies: [MovieViewModel]) -> Void) {
        MovieAPI.getTopRated { result in
            prepareCompletion(result: result, completion: completion)
        }
    }
    
    static func prepareCompletion(result: Result<Page<Movie>>, completion: @escaping (_ movies: [MovieViewModel]) -> Void) {
        switch result {
        case .success(let page):
            if let movies = page.results {
                var auxMovies: [MovieViewModel] = []
                for movie in movies {
                    auxMovies.append(MovieViewModel(movie))
                }
                completion(auxMovies)
                return
            }
            completion([])
        default:
            completion([])
        }
    }
}
