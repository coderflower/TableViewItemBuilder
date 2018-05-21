//
//  SFExtension.swift
//  JOU-Swift
//
//  Created by 花菜 on 2018/4/28.
//  Copyright © 2018年 Coder.flower. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/// 是否开启日志
public let SFLogStatus  = true

public func myLog<T>(_ message:T,file:String = #file,funcName:String = #function,lineNum:Int = #line){
    if SFLogStatus == true {
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName)---->第\(lineNum)行---->\(message)")
    }
}


public extension CGFloat {
    var fit: CGFloat {
        return CGFloat(ceilf(Float(SFConst.scale * self)))
    }
}
public extension Float {
    var fit: CGFloat {
        return CGFloat(ceilf(Float(SFConst.scale * CGFloat(self))))
    }
}

public extension Double {
    var fit: CGFloat {
        return CGFloat(ceilf(Float(SFConst.scale * CGFloat(self))))
    }
}

public extension Int {
    var fit: CGFloat {
        return CGFloat(ceilf(Float(SFConst.scale * CGFloat(self))))
    }
}



extension ObservableConvertibleType {
    func repeatWhen<O: ObservableType>(_ other: O) -> Observable<E> {
        return other.map { _ in }
            .startWith(())
            .flatMap { () -> Observable<E> in
                self.asObservable()
        }
    }
}

extension Reactive where Base: AnyObject {
    
    public func trigger(for sel: Selector) -> ControlEvent<Bool> {
        let source = self.methodInvoked(sel).map {
            $0.first as? Bool ?? false
        }
        return ControlEvent(events: source)
    }
}



