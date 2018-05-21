//
//  UITableView-Extension.swift
//  JOU-Swift
//
//  Created by 花菜 on 2018/4/28.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

/// dequeue
extension UITableView {
    
    func cell<T: UITableViewCell>(ofType cellType: T.Type, reuseIdentifier: String = T.reuseIdentifier) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier) as? T else {
            fatalError()
        }
        return cell
    }
    
    func headerFooter<T: UITableViewHeaderFooterView>(ofType viewType: T.Type, reuseIdentifier: String = T.reuseIdentifier) -> T {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T else {
            
            fatalError()
            
        }
        return view
    }
}
/// register
extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
        register(cellType, forCellReuseIdentifier: reuseIdentifier)
    }
    func register<T: UITableViewCell>(nibType: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
        register(nibType.nib(), forCellReuseIdentifier: reuseIdentifier)
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(nibType: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
        register(nibType.nib(), forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ anyClass: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
        register(anyClass, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
}
