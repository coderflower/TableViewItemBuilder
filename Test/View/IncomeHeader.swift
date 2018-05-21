//
//  IncomeHeader.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/18.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

class IncomeHeader: SFBaseView {
    /// 可提现余额
    @IBOutlet weak var availableBalanceLabel: UILabel!
    /// 金币数量
    @IBOutlet weak var goldcoinLabel: UILabel!
    /// 奖励金
    @IBOutlet weak var rewardLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    override func initSubviews() {
        bottomView.layer.cornerRadius = 10
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottomView.layer.shadowOpacity = 0.3
    }

}
