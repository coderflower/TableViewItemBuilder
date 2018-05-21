//
//  UIStoryboard-SFExtension.swift
//  Test
//
//  Created by 花菜 on 2018/5/21.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit
extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(ofType type: T.Type = T.self) -> T  {
        guard let viewController = instantiateViewController(withIdentifier: type.reuseIdentifier) as? T else {
            fatalError()
        }
        return viewController
    }
}
