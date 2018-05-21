//
//  SFBaseView.swift
//  CB-Swift
//
//  Created by 花菜 on 2018/4/13.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class SFBaseView: UIView {
    var bag = DisposeBag()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        initSubviews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        initSubviews()
    }
    
     public func initSubviews() {}
    
}


