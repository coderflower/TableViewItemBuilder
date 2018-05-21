//
//  MyGoldCoinTableViewCell.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/18.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

class MyGoldCoinTableViewCell: SFBaseTableViewCell {
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var priceButton: UIButton!
    override func initialize() {
        super.initialize()
        priceButton.layer.borderWidth = 1
        priceButton.layer.borderColor = UIColor.black.cgColor
    }
    
    override func layoutSubviews() {
       
    }
    
}
