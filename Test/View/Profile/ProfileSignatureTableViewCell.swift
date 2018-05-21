//
//  ProfileSignatureTableViewCell.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/21.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit

class ProfileSignatureTableViewCell: SFBaseTableViewCell {

    /// 个性签名
    @IBOutlet weak var signatureLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ProfileSignatureTableViewCell: Updatable {
    struct Model {
        /// 个性qian'ming
        let signature: String
        
    }
    
    func update(_ model: Model) {
        signatureLabel.text = model.signature
    }
}
