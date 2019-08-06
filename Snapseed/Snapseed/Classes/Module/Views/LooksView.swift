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

    private let looksArray = ["Portraint", "Smooth", "Pop", "Accentuate", "Faded Glow", "Morning", "Bright", "Fine Art", "Push", "Structure", "Silhouette"]
    private var image: UIImage?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    
    private func setupView() {
        self.backgroundColor = .white
        
//        let layout = UICollectionViewCenterLayout()
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCollectionViewCellIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.height.equalTo(self)
        }
    }
    
    // MARK: - Public API
    func showImageView(_ image: UIImage) {
        self.image = image
        collectionView.reloadData()
    }
}

extension LooksView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return looksArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellIdentifier, for: indexPath) as! ImageCollectionViewCell
        cell.title = looksArray[indexPath.row]
        cell.image = self.image
        cell.backgroundColor = .white
        return cell
    }
    
}

extension LooksView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}

extension LooksView: UICollectionViewDelegate {
    
}
