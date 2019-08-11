//
//  PhotoResponse.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - PhotoResponse
class PhotoResponse: Mappable {
    var photos: PhotosData?
    var stat: String?
    var code: String?
    var message: String?
    
    init(photos: PhotosData? = nil, stat: String? = nil, code: String? = nil, message: String? = nil) {
        self.photos = photos
        self.stat = stat
        self.code = code
        self.message = message
    }

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        photos <- map["photos"]
        stat <- map["stat"]
        code <- map["code"]
        message <- map["message"]
    }
    
}
