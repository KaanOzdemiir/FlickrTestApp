//
//  FeedDetailViewModel.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 11.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift

class FeedDetailViewModel {
    
    let disposeBag = DisposeBag()
    
    let photo = BehaviorSubject<PhotoData>(value: PhotoData())
}
