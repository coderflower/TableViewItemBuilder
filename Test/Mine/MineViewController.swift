//
//  MineViewController.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/16.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit
import RxGesture
import RxSwift
class MineViewController: UIViewController {
    lazy var sections: [[Configurable]] = createRows()
   
    let header: MineHeader = MineHeader.xibView()
    let bag = DisposeBag()
    
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initSubViews()
        configNavigationBar()
    }
    func configNavigationBar() {
        title = "我的"
     
    }
    
    func initSubViews() {
        
        header.frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: 88.fit)
        tableView.tableHeaderView = header
        tableView.register(nibType: MineTitleSwitchTableViewCell.self)
        tableView.register(nibType: MineDefaultTableViewCell.self)
        
   
        let tap = UITapGestureRecognizer(target: self, action: #selector(MineViewController.toProfile))
        header.addGestureRecognizer(tap)
    }
    @objc func toProfile() {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(ofType: ProfileViewController.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createRows() -> [[Configurable]] {
       
        let flag = UserService.shared.user.gender == .female
        var sections: [[Configurable]]
        var section1: [Configurable]
        var section2: [Configurable]
        let row1 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "我的收益", subtitle: "0.00元"), callBack:{ [unowned self] in
            self.toIncomeViewController()
        })
        let row2 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "我的金币", subtitle: "金币 * 0"), callBack: {[unowned self] in
            self.toMyGoldCoinViewController()
        })
        let row3 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "我的动态"), callBack: {
            myLog("我的动态")
        })
        let row4 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "我的VIP", subtitle: "未开通"), callBack: {
            myLog("我的VIP")
        })
        let row5 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "女生特权", subtitle: "免费"), callBack: {
            myLog("女生特权")
        })
        let row6 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "声优认证", subtitle: "未认证"), callBack: {
            myLog("声优认证")
        })
        let row7 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "我的等级", subtitle: "见习声优"), callBack: {
            myLog("我的等级")
        })
        let row8 = TableViewItemBuilder<MineTitleSwitchTableViewCell>(model: MineSwitchModel(title: "接收偷听", isOn: true, type: .eavesdrop))
        let row9 = TableViewItemBuilder<MineTitleSwitchTableViewCell>(model: MineSwitchModel(title: "开启接听", isOn: true, type: .receive))
        let row10 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "奖励活动"), callBack: {
            myLog("奖励活动")
        })
        let row11 =  TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "分享赚金币"), callBack: {
            myLog("分享赚金币")
        })
        if flag {
            section1 = [row2,row3,row4,row7,row8,row9]
            section2 = [row11]
        } else {
            section1 = [row1, row2, row3, row4, row5, row6, row7, row8, row9]
            section2 = [row10,row11]
        }
        
        let row12 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "意见反馈"), callBack: { [unowned self] in
            self.toFeedBackController()
        })
        let row13 = TableViewItemBuilder<MineDefaultTableViewCell>(model: MineDefaultModel(title: "设置"), callBack: { [unowned self] in
            self.toSetViewController()
        })
        sections = [section1,section2]
        sections.append([row12,row13])
        return sections
    }
    
}
// MARK: - Cell事件
extension MineViewController {
    fileprivate func toSetViewController() {
        myLog("toSetViewController")
    }
    fileprivate func toFeedBackController() {
        
       myLog("toFeedBackController")
        
    }
    fileprivate func toIncomeViewController() {
        
       myLog("toIncomeViewController")
        
    }
    
    fileprivate func toMyGoldCoinViewController() {
         myLog("toMyGoldCoinViewController")
    }
}


extension MineViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections[section].count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44.fit
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.reuseIdentifier)!
        item.configure(cell)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section][indexPath.row]
        guard let callBack = item.callBack else {
            return
        }
        callBack()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         return 0.001
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.fit
    }
}


