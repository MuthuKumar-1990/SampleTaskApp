//
//  ViewController.swift
//  SampleApp
//
//  Created by Jack on 10/04/21.
//  Copyright © 2021 IndianExpress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var videoCollectionView: UICollectionView!
    var imageData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.videoCollectionView.register(UINib (nibName: "VideoViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.videoCollectionView.delegate = self
        self.videoCollectionView.dataSource = self
        imageData = ["img1","img2","img1","img2"]
        self.collectionViewFlowLayout()
        
    }
    
    func collectionViewFlowLayout() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        self.videoCollectionView!.collectionViewLayout = layout
        self.videoCollectionView.isPagingEnabled = true
        self.videoCollectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = videoCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! VideoViewCell
        cell.videoView.image = UIImage.init(imageLiteralResourceName: imageData[indexPath.row])
        return cell
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        return size
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.videoCollectionView.contentOffset.y < 0) {
            self.videoCollectionView.contentOffset = CGPoint(x: self.videoCollectionView.contentOffset.x, y: 0.0)
        }
    }
}
