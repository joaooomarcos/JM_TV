//
//  Image.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Foundation

class ImageEndpoint: Endpoint {
    
    var path: String {
        return imgPath
    }
    
    var base: String {
        return "https://image.tmdb.org"
    }
    
    enum Size: String {
        case original = "t/p/original"
        case w500 = "t/p/w500"
    }
    
    var imgPath: String
    
    init(_ size: Size, _ imgPath: String) {
        self.imgPath = size.rawValue + imgPath
    }
}
