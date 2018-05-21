//
//  ProfileLabelTableViewCell.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/21.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

class ProfileSignTableViewCell: SFBaseTableViewCell {
    
    
    @IBOutlet weak var tagListView: TagListView!
    var signs = [String]()
    
}

extension ProfileSignTableViewCell: Updatable {
    struct Model {
        /// 标签数组
        let signs: [String]
        
    }
    
    func update(_ model: Model) {
        /// 移除原有的,防止循环引用
        tagListView.removeAllTags()
        tagListView.addTags(model.signs)
    }
}
