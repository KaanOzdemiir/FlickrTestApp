//
//  PhotoData.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - PhotoData
class PhotoData: Mappable {
    var id, owner, secret, server: String?
    var farm: Int?
    var title: String?
    var isPublic, isFriend, isFamily: Int?
    
    init(id: String? = nil, owner: String? = nil, secret: String? = nil, server: String? = nil, farm: Int? = nil, title: String? = nil, ispublic: Int? = nil, isfriend: Int? = nil, isfamily: Int? = nil) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.isPublic = ispublic
        self.isFriend = isfriend
        self.isFamily = isfamily
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        owner <- map["owner"]
        secret <- map["secret"]
        server <- map["server"]
        
        farm <- map["farm"]
        title <- map["title"]
        isPublic <- map["ispublic"]
        isFriend <- map["isfriend"]
        isFamily <- map["isfamily"]
    }
}
