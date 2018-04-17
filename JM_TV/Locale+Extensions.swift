//
//  Locale+Extensions.swift
//  JM_TV
//
//  Created by João Marcos on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import Foundation

extension Locale {
    static var languageAndRegion: String {
        guard let language = self.preferredLanguages.first else {
            return "en-US"
        }
        
        return language
    }
}
