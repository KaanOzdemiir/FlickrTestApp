//
//  RecentPhotoViewModel.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RecentPhotoViewModel {
    let disposeBag = DisposeBag()
    
    let photoResponse = PublishSubject<PhotoResponse>()
    
    let recentPhotos = BehaviorRelay<[PhotoData]>(value: [])
        
    var serviceParams = RecentPhotoServiceParam()
    
    var isFetchingNextPage = false
    
    func fetchRecentPhotos() {
        
        isFetchingNextPage = true
        if serviceParams.hasMore {
            requestGetRecentPhotos(serviceParams: serviceParams)
                .subscribe(onNext: {[weak self] (photoResponse) in
                    
                    self?.photoResponse.onNext(photoResponse)
                    
                    if let photos = photoResponse.photos?.photo {
                        self?.recentPhotos.accept((self?.recentPhotos.value ?? []) + photos)
                    }
                    
                    self?.isFetchingNextPage = false
                    
                    self?.serviceParams.page += 1
                    if let total = photoResponse.photos?.total,  self!.serviceParams.page * self!.serviceParams.perPage < total {
                        self?.serviceParams.hasMore = true
                    }else {
                        self?.serviceParams.hasMore = false
                    }
                    
                    
                    print("Recent Photos Request is sent without problems! \n")
                    }, onError: {[weak self] (error) in
                        self?.photoResponse.onError(error)
                        print("Error-->", error)
                    }, onCompleted: {
                        print("Request is complited!\n")
                }) {
                    print("Reqeust is released!\n")
                }.disposed(by: disposeBag)
        }
    }
    
}

