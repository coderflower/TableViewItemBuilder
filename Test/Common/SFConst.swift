//
//  SFConst.swift
//  JOU-Swift
//
//  Created by 花菜 on 2018/4/28.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit
@_exported import RxCocoa
@_exported import RxSwift




///  是否是开发状态
let isDev: Bool = true

public struct SFConst {
    /// 导航栏高度
    public static let navigationBarHeight: CGFloat = UIDevice.isX ? 88 : 64
    /// tabBar 高度
    public static let tabBarHeight: CGFloat = UIDevice.isX ? 83 : 49
    /// 状态栏高度
    public static let statusBarHeight: CGFloat = UIDevice.isX ? 44: 20
    /// 屏幕适配比例
    public static let scale: CGFloat = UIScreen.main.bounds.width / 375.0
}

/// BaseUrl
extension SFConst {
    static var baserUrl: (cookieDomain: String, mainUrl: String,staticUrl: String, staticUrl2: String,uploadImgUrl: String) {
        if isDev == true {
            return ("1.1.1.1",
                    "http://1.1.1.1/cb-api/api/",
                    "http://1.1.1.1/cb-static/static/",
                    "http://1.1.1.1/cb-static/api/",
                    "http://1.1.1.1/cb-file/api/")
        } else {
            return ("www.test.com",
                    "http://www.test.com/cb-api/api/",
                    "http://www.test.com/cb-static/static/",
                    "http://www.test.com/cb-static/api/",
                    "http://www.test.com/cb-file/upload/api/")
        }
    }
    
    static func cookieExisted() -> Bool {
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                if cookie.domain == baserUrl.cookieDomain,
                    let expirationData = cookie.expiresDate {
                    let currentDate = Date()
                    let result = currentDate.compare(expirationData)
                    if result != ComparisonResult.orderedAscending {
                        return false
                    } else {
                        return true
                    }
                }
            }
        }
        return false
        
    }
    static func deleteCookie() {
        let cookies = HTTPCookieStorage.shared.cookies
        for  cookie in cookies ?? [] {
            if cookie.domain == baserUrl.cookieDomain {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }
    }
}
/// 通知相关
extension SFConst {
    
}
