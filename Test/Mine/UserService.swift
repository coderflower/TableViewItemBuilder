//
//  UserService.swift
//  Dolphin
//
//  Created by 花菜 on 2018/5/18.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//


final class UserService {
    static let shared = UserService()
    let user = UserInfo()
}

 struct UserInfo {
    let nickname: String = "就是要叫花菜"
    let imageAvatar: String = ""
    let id: String = "134556"
    let gender: UserGender = .male
}

enum UserGender {
    case male
    case female
}
