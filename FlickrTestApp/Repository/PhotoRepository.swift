//
//  PhotoRepository.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

func requestGetRecentPhotos(serviceParams: RecentPhotoServiceParam) -> Observable<PhotoResponse> {
    
    return Observable.create{observer -> Disposable in
        // buradaki işlemler rx 'te yapılacak.
        
        AlamofireService.getRecentPhotos(serviceParams: serviceParams).responseObject {
            (response:DataResponse<PhotoResponse>) in
            if(response.error != nil ){
                print("❌⭕️❌ getRecentPhotos is failed!")
                observer.onError(response.error!)
                observer.onCompleted()
                return
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data ?? Data(), options: .mutableContainers)
                    print("----------------------------- ✅ Successfully fetched JSON--------------------------- \n\n\n \(json) \n\n\n ----------------------------------------------------------------------")
                    
                }catch let error {
                    print("JSON Error :", error)
                }
                
                
                let data = response.result.value
                if data?.stat?.boolValue ?? false {
                    observer.onNext(data!)
                    observer.onCompleted()
                }else {
                    
                    let error = FlickrError(code: data?.code, message: data?.message)
                    
                    observer.onError(error)
                    observer.onCompleted()
                }
            }
        }
        return Disposables.create()
    }
}
