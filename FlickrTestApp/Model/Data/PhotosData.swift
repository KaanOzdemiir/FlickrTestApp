//
//  PhotosData.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - PhotosData
class PhotosData: Mappable {
    var page, pages, perpage: Int?
    var total: Int?
    var photo: [PhotoData]?
    
    init(page: Int? = nil, pages: Int? = nil, perpage: Int? = nil, total: Int? = nil, photo: [PhotoData]? = nil) {
        self.page = page
        self.pages = pages
        self.perpage = perpage
        self.total = total
        self.photo = photo
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        pages <- map["pages"]
        perpage <- map["perpage"]
        total <- map["total"]
        photo <- map["photo"]
    }
}
