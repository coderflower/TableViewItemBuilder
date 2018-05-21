//
//  NibLoadable.swift
//  JOU-Swift
//
//  Created by 花菜 on 2018/4/28.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit
protocol NibLoadable {}
extension UIView: NibLoadable {}

extension NibLoadable where Self: UIView {
    static func xibView(_ nibName: String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibName ?? "\(self)", owner: nil, options: nil)?.last! as! Self
    }
    
    static func nib(bundle: Bundle? = nil) -> UINib {
        return UINib.init(nibName: "\(self)", bundle: bundle)
    }
}





