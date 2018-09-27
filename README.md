# 网络监听组件文档

## 1.提供的功能
### 网络监听和获取当前网络状态

## 2.使用方法

1.在Delegate中注册网络监听：
TSNetworkMonitor.registerMonitor()

2.开启监听（哪里使用哪里添加，需要在监听对象销毁的时候移除通知）

TSNetworkMonitor.shared.addNetworkNotification(self, #selector(netChange))
或是 
TSNetworkMonitor.shared.addNetworkNotificationBlock { (not) in
            
}

3.获取当前网络状态：TSNetworkMonitor.shared.reachabilityStatus


5.关闭监听： TSNetworkMonitor.shared.stopNotifier
