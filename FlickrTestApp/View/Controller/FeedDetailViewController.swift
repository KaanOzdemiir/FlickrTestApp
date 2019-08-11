//
//  FeedDetailViewController.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 11.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Kingfisher

class FeedDetailViewController: UIViewController {
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet weak var imageTitleLabel: UILabel!
    let feedDetailViewModel = FeedDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        photoDataSubscribe()
    }
    
    func photoDataSubscribe() {
        feedDetailViewModel.photo.subscribe(onNext: { [weak self] (photoData) in
            
            if let server = photoData.server,
                let secret = photoData.secret,
                let id = photoData.id,
                let url = URL(string: "https://live.staticflickr.com/\(server)/\(id)_\(secret)_c.jpg") {
                
                print("https://live.staticflickr.com/\(server)/\(id)_\(secret)_c.jpg")
                let resource = ImageResource(downloadURL: url, cacheKey: id)
                self?.feedImageView.kf.setImage(with: resource)
                
                self?.imageTitleLabel.text = photoData.title
                
            }
        })
            .disposed(by: feedDetailViewModel.disposeBag)
    }
}
