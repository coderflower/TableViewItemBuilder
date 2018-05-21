//
//  MineDefaultTableViewCell.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/17.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

class MineDefaultTableViewCell: SFBaseTableViewCell {

    override func initialize() {
        textLabel?.font = FontHelper.regular(14)
        detailTextLabel?.font = FontHelper.light(12)
        textLabel?.textColor = UIColor.black
        detailTextLabel?.textColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MineDefaultTableViewCell: Updatable {
    func update(_ model: MineDefaultModel) {
        let hidden = model.subtitle == nil ? true : false
        detailTextLabel?.isHidden = hidden
        textLabel?.text = model.title
        detailTextLabel?.text = model.subtitle
    }
}
