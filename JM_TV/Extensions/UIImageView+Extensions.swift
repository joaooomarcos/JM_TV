//
//  UIImageView+Extensions.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 18/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(with URL: URL) {
        self.af_setImage(withURL: URL, placeholderImage: #imageLiteral(resourceName: "placeholder"), imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false)
    }
}
