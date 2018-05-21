//
//  ProfileGiftTableViewCell.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/21.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

class ProfileGiftTableViewCell: SFBaseTableViewCell {
    var items: [Model.Gift]?
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func initialize() {
        collectionView.register(nibType: ProfileGiftCollectionCell.self)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layout.itemSize = CGSize(width: collectionView.bounds.width / 6, height: 55)
    }
}
extension ProfileGiftTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cell(ofType: ProfileGiftCollectionCell.self, indexPath: indexPath)
        
        if let gift = items?[indexPath.row] {
            cell.iconImageView.image = UIImage(named: gift.icon)
            cell.countLabel.text = "X\(gift.count)"
        }
        
        return cell
        
    }
}

extension ProfileGiftTableViewCell: Updatable {
    struct Model {
        /// 礼品数组
        let gifts: [Gift]
        
        struct Gift {
            let icon: String
            let count: Int
        }
    }
    
    func update(_ model: Model) {
        items = model.gifts
    }
}
