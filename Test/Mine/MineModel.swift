//
//  MineModel.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/18.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

struct MineDefaultModel {
    let title: String
    let subtitle: String?
    init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
}

struct MineSwitchModel {
    enum RowType {
        /// 偷听
        case eavesdrop
        /// 接听
        case receive
    }
    let title: String
    let isOn: Bool
    let type: RowType
}
