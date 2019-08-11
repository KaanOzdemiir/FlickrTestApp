//
//  FeedDetailViewController.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 11.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet weak var imageTitleLabel: UILabel!
    let feedDetailViewModel = FeedDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
