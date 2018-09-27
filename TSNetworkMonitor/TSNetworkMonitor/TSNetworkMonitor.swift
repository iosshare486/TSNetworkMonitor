//
//  TSNetworkMonitor.swift
//  TSNetWork
//
//  Created by 小铭 on 2018/6/15.
//  Copyright © 2018年 caiqr. All rights reserved.
//  网络监听

import UIKit
import Reachability

/// 网络状态枚举
public enum TSListenerStatus {
    case tsWifi //wifi
    case tsWan  //移动网络
    case tsOther    //其他
    case tsNoNet    //无网络
}

public class TSNetworkMonitor  {
    let reachability = Reachability()
    
    /// 网络状态
    public var reachabilityStatus : TSListenerStatus {
        set {
            
        }
        get {
            // 检测网络类型
            if reachability!.connection == .wifi {
                return TSListenerStatus.tsWifi
            } else if reachability!.connection == .cellular {
                return TSListenerStatus.tsWan
            } else if reachability!.connection == .none {
                return TSListenerStatus.tsNoNet
            } else {
                return TSListenerStatus.tsOther
            }
        }
    }
    
    public static let shared = TSNetworkMonitor.init()
    private init() { }
    
    //监听网络变化（不需要移除该监听,直到调用stopNotifier方法）
    public func addNetworkNotification (_ target : Any, _ selector : Selector) {
        NotificationCenter.default.addObserver(target, selector: selector, name: .reachabilityChanged, object: nil)
    }
    
    //监听网络变化Block 方式
    public func addNetworkNotificationBlock (_ block : @escaping ((Notification)->Swift.Void)) {
        NotificationCenter.default.addObserver(forName: .reachabilityChanged, object: nil, queue: nil, using: block)
    }
    
    //注册网络监听
    public class func registerMonitor () {
        do {
            // 开始监听
            try TSNetworkMonitor.shared.reachability?.startNotifier()
        } catch {
            debugPrint("网络监听开启失败")
        }
    }
    //停止网络监听
    public func stopNotifier () {
        reachability!.stopNotifier()
    }
}
