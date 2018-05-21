//
//  MineTitleSwitchTableViewCell.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/17.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

class MineTitleSwitchTableViewCell: SFBaseTableViewCell {
    var model: MineSwitchModel?
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func initialize() {
        textLabel?.font = FontHelper.regular(14)
        detailTextLabel?.font = FontHelper.light(12)
        textLabel?.textColor = UIColor.black
        detailTextLabel?.textColor = UIColor.lightGray
    }
    @IBAction func switchtValueChange(_ sender: UISwitch) {
        guard let model = model else {
            return
        }
        if model.type == .receive {
            myLog("点击了开启监听")
        } else {
            myLog("点击了接受偷听")
        }
    }
}


extension MineTitleSwitchTableViewCell: Updatable {
    func update(_ model: MineSwitchModel) {
        self.model = model
        textLabel?.text = model.title
        self.switch.isOn = model.isOn
    }
}
