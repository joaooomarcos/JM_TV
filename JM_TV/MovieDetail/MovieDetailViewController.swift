//
//  MovieDetailViewController.swift
//  JM_TV
//
//  Created by João Marcos on 18/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - Variables
    
    var movieVM: MovieViewModel?
    
    // MARK: - Outlets
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var synopsisTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupLayout() {
        if let movie = movieVM {
            self.posterImageView.setImage(with: movie.coverParh)
            self.synopsisTextView.text = movie.synopsis
            self.title = movie.title
        }
    }

}
