//
//  ProfileCallInfoTableViewCell.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/21.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

class ProfileCallInfoTableViewCell: SFBaseTableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ProfileCallInfoTableViewCell: Updatable {
    struct Model {
        /// 好评率
        let percentage: String
        /// 通话时长
        let timeString: String
        
    }
    
    func update(_ model: Model) {
        timeLabel.text = "本周通话时长:  \(model.timeString)"
        percentLabel.text = model.percentage
    }
}
