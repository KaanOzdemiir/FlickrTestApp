//
//  ViewController.swift
//  FlickrTestApp
//
//  Created by Kaan Ozdemir on 10.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit
import RxCocoa

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let recentPhotoViewModel = RecentPhotoViewModel()
    
    let feedCellIdentifier = "feedTableViewCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading()
        recentPhotoViewModel.fetchRecentPhotos()
        
        rxTableViewBind()
        
    }
    
    func rxTableViewBind() {
        
        feedTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: feedCellIdentifier)
        feedTableView.prefetchDataSource = self

        
        // BINDING RECENTPHOTOS TO TABLEVIEW
        recentPhotoViewModel.recentPhotos.asObservable().bind(to: feedTableView
            .rx
            .items(cellIdentifier: feedCellIdentifier, cellType: FeedTableViewCell.self)) { [weak self] (row, photoData, cell) in
                
                self?.stopLoading()
                cell.setWith(photoData: photoData)
            }
            .disposed(by: recentPhotoViewModel.disposeBag)
    }
    
    func loading() {
        spinner.startAnimating()
    }
    
    func stopLoading() {
        spinner.stopAnimating()
    }

}

extension FeedViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        print("PREFETCHING \(indexPaths)")
        
        
        let needsFetch = indexPaths.contains{$0.row >= self.recentPhotoViewModel.recentPhotos.value.count - 1}
        
        if needsFetch {
            guard !recentPhotoViewModel.isFetchingNextPage else {
                return
            }
            recentPhotoViewModel.fetchRecentPhotos()
        }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            print("CANCELED PREFETCHING --> \(indexPath.row)")
        }
    }
}
