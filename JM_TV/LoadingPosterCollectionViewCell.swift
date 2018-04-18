//
//  LoadingPosterCollectionViewCell.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 18/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import UIKit

class LoadingPosterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "loadingCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.animate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
    }
    
    private func animate() {
        UIView.animate(withDuration: randomDouble(min: 0.7, max: 1.3), animations: {
            self.alpha = 0.2
        }, completion: { [weak self] _ in
            if let oiself = self {
                UIView.animate(withDuration: oiself.randomDouble(min: 0.7, max: 1.3), animations: {
                    oiself.alpha = 1.0
                }, completion: { [weak self] _ in
                    self?.animate()
                })
            }
            
        })
    }
    
    func randomDouble(min: Double, max: Double) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
}
