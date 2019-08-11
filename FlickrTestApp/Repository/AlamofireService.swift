//
//  AlamofireService.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireService {
    
    private static let host = "www.flickr.com"
    
    private static let path = "/services/rest"

    private static let apiKey = "b2d62c53a6dddb2cd1131e55436484cd"
    
    static func getRecentPhotos(serviceParams: RecentPhotoServiceParam) -> DataRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = ConnectionProtocol.https
        urlComponents.host = host
        urlComponents.path = path
        
        urlComponents.queryItems = [
            URLQueryItem(name: "method", value: ServiceMethod.getRecentPhotos),
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "format", value: serviceParams.format),
            URLQueryItem(name: "page", value: "\(serviceParams.page)"),
            URLQueryItem(name: "per_page", value: "\(serviceParams.perPage)"),
            URLQueryItem(name: "nojsoncallback", value: serviceParams.noJsonCallback)
        ]
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        
        print("\n getRecentPhotos Params -->", serviceParams)
        
        print("\n🔵\(String(describing: urlComponents.string)) --> Sending Request.......\n")
        return  Alamofire.request(urlComponents.string!, method: .get, encoding: URLEncoding.default, headers: headers)
    }
    
}
