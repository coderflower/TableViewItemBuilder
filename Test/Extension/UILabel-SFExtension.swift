//
//  UILabel-SFExtension.swift
//  CB-Swift
//
//  Created by 花菜 on 2018/4/16.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(_ text: String = "", font: UIFont = FontHelper.regular(12), color: UIColor = UIColor.init(hex: "333333"), textAlignment: NSTextAlignment = .center) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = textAlignment
    }
    
}
extension UILabel {
    /*
     enum FontType {
     case thin
     case light
     case regular
     case medium
     case semibold
     }
     */
    @IBInspectable var regular: CGFloat {
        get {
            return 1
        }
        set {
            self.font = FontHelper.regular(newValue)
        }
    }
    
    @IBInspectable var light: CGFloat {
        get {
            return 1
        }
        set {
            self.font = FontHelper.light(newValue)
        }
    }
    @IBInspectable var medium: CGFloat {
        get {
            return 1
        }
        set {
            self.font = FontHelper.medium(newValue)
        }
    }
    
}
