//
//  FeedTableViewCell.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Kingfisher

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var transparentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setWith(photoData: PhotoData) {
        if let server = photoData.server,
            let secret = photoData.secret,
            let id = photoData.id,
            let url = URL(string: "https://live.staticflickr.com/\(server)/\(id)_\(secret)_c.jpg") {
            
            print("https://live.staticflickr.com/\(server)/\(id)_\(secret)_c.jpg")
            
            let processor = DownsamplingImageProcessor(size: photoImageView.frame.size)
                >> RoundCornerImageProcessor(cornerRadius: 20)
            photoImageView.kf.indicatorType = .activity
            photoImageView.kf.setImage(
                with: url,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in

                self.spinner.stopAnimating()
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            }
            
            
            let resource = ImageResource(downloadURL: url, cacheKey: id)
            photoImageView.kf.setImage(with: resource)
            
            
            if let title = photoData.title, !title.isEmpty {
                transparentView.isHidden = false
                self.headerLabel.text = title
            }else {
                transparentView.isHidden = true
            }
        }
    }
    
}
