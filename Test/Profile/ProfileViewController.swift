//
//  ProfileViewController.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/20.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

/**
 女~
 通话信息
 个性签名
 个人技能
 收到礼物
 最近访客
 
 男
 通话信息
 个性签名
 我喜欢
 送出礼物
 最近访客
 */
import UIKit
/// 个人详情页
class ProfileViewController: UIViewController {
    let header = ProfileTableViewHeader.xibView()
    var rows = [Configurable]()
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let model = ProfileGiftTableViewCell.Model(gifts: [
            ProfileGiftTableViewCell.Model.Gift(icon: "tab_Mind_on", count: 10),
            ProfileGiftTableViewCell.Model.Gift(icon: "tab_Mind_on", count: 10),
            ProfileGiftTableViewCell.Model.Gift(icon: "tab_Mind_on", count: 10),
            ProfileGiftTableViewCell.Model.Gift(icon: "tab_Mind_on", count: 10),
            ProfileGiftTableViewCell.Model.Gift(icon: "tab_Mind_on", count: 10),
            ProfileGiftTableViewCell.Model.Gift(icon: "tab_Mind_on", count: 10),
            ProfileGiftTableViewCell.Model.Gift(icon: "tab_Mind_on", count: 10),
            ProfileGiftTableViewCell.Model.Gift(icon: "tab_Mind_on", count: 10),
            ])
        let signModel = ProfileSignTableViewCell.Model(signs: ["测试标签","测试标签","测试标签","测试标签","测试标签","测试标签"])
        rows = [
            TableViewItemBuilder<ProfileCallInfoTableViewCell>(model: ProfileCallInfoTableViewCell.Model(percentage: "70", timeString: "55分46秒")),
            TableViewItemBuilder<ProfileSignatureTableViewCell>(model: ProfileSignatureTableViewCell.Model(signature: "无个性,不签名!")),
            TableViewItemBuilder<ProfileGiftTableViewCell>(model: model, cellHeight: (55 * 2 + 65)),
            TableViewItemBuilder<ProfileSignTableViewCell>(model: signModel)
        ]
       
        
        initSubViews()
        configNavigationBar()
    }
    func initSubViews() {
        /// 注册 cell
        tableView.register(nibType: ProfileCallInfoTableViewCell.self)
        tableView.register(nibType: ProfileSignatureTableViewCell.self)
        tableView.register(nibType: ProfileGiftTableViewCell.self)
        tableView.register(nibType: ProfileSignTableViewCell.self)
        /// 添加 header
        header.frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.width + 12.fit)
        tableView.tableHeaderView = header
    }
    func configNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        title = "就是要叫如花"
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor(white: 1, alpha: 1)]
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier)!
        row.update(cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = rows[indexPath.row]
        return row.cellHeight
    }
}
extension ProfileViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var alpha: CGFloat = 0
        /// 计算透明度
        alpha = scrollView.contentOffset.y / SFConst.navigationBarHeight
        if alpha > 1 {alpha = 1} else if alpha < 0 {alpha = 0}
        /// 设置导航栏背景颜色
        navigationController?.navigationBar.setBackgroundImage(UIImage.image(UIColor(white: 1, alpha: alpha)), for: .default)
        /// 返回箭头等 item 的颜色
        navigationController?.navigationBar.tintColor = UIColor(white: 1 - alpha, alpha: 1)
        /// 标题颜色
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor(white: 1 - alpha, alpha: 1)]
    }
}
