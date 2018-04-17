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
        let url = MovieEndpoint.detail(354912).url
        let params: [String: Any] = ["teste": "123"]
        
        NetworkManager().request(url: url, parameters: params, completion: completion)
    }

}
