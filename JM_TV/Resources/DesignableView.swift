//
//  DesignableView.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 18/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import UIKit

@IBDesignable
class JMImageView: UIImageView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var clipping: Bool {
        get {
            return clipsToBounds
        }
        set {
            clipsToBounds = newValue
        }
    }
}
