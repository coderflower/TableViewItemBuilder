//
//  SFBaseTableViewCell.swift
//  CB-Swift
//
//  Created by 花菜 on 2018/4/13.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class SFBaseTableViewCell: UITableViewCell {
    var bag = DisposeBag()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        initialize()
    }

    public func initialize() {
        selectionStyle = .none
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
}
