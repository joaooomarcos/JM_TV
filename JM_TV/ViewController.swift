//
//  ViewController.swift
//  JM_TV
//
//  Created by João Marcos on 16/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getMovies() {
        oi { result in
            switch result {
            case .success(let movie):
                print(movie)
            case .error(let error):
                print(error)
            }
        }
    }
    
    func oi(completion: @escaping (Result<Movie>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/354912")
        let params: [String: Any] = ["api_key": "d6390c4acae0196b3b9ff2e4cd6bb392",
                                     "language": "en-US"]
        
        NetworkManager().request(url: url!, parameters: params, completion: completion)
    }

}
