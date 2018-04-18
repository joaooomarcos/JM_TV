//
//  PosterCollectionViewCell.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import AlamofireImage
import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var posterImage: UIImageView!
    
    func setup(with movieVM: MovieViewModel) {
        self.posterImage.setImage(with: movieVM.coverParh)
    }
    
}
