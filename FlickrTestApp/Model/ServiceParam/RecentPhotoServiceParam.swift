//
//  RecentPhotoServiceParam.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation

class RecentPhotoServiceParam {
    var perPage = 20
    var page = 1
    var format = "json"
    var noJsonCallback = "1"
    var hasMore = true
    
    init(perPage: Int = 20, page: Int = 1, format: String = "json", noJsonCallback: String = "1", hasMore: Bool = true) {
        self.perPage = perPage
        self.page = page
        self.format = format
        self.noJsonCallback = noJsonCallback
        self.hasMore = hasMore
    }
}
