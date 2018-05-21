//
//  UIDevice-SFExtension.swift
//  CB-Swift
//
//  Created by 花菜 on 2018/4/13.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

extension UIDevice {
    
    public static var isX: Bool {
        return UIScreen.main.bounds.height == 812
    }
    
    public static var uuid: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? "1"
    }
}
