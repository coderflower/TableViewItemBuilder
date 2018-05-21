//
//  Reusable.swift
//  JOU-Swift
//
//  Created by 花菜 on 2018/4/28.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit
protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Reusable {}
extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
extension UICollectionViewCell: Reusable {}
extension UICollectionReusableView: Reusable {}


