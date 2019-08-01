//
//  LooksView.swift
//  Snapseed
//
//  Created by Xuli Chen on 2019/8/1.
//  Copyright © 2019 Huni. All rights reserved.
//

import UIKit

class LooksView: UIView {

    private let kCollectionViewCellIdentifier = "ImageCollectionViewCell"
    
    private var collectionView: UICollectionView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .blue
        
        let layout = UICollectionViewCenterLayout()
        layout.estimatedItemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height), collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCollectionViewCellIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.addSubview(collectionView)
    }

}

extension LooksView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellIdentifier, for: indexPath) as! ImageCollectionViewCell
        
        cell.backgroundColor = .yellow
        return cell
    }
    
}

extension LooksView: UICollectionViewDelegate {
    
}
