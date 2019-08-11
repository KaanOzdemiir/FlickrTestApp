//
//  FlickrError.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation

class FlickrError: Error {
    
    var message: String?
    var code: String?
    
    init(code: String?, message: String?) {
        self.code = code
        self.message = message
    }
    
}
