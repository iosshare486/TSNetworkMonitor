# 网络监听组件文档

## 1.提供的功能
### 网络监听和获取当前网络状态

## 2.使用方法

1.在Delegate中注册网络监听：
TSNetworkMonitor.registerMonitor()

2.开启监听（哪里使用哪里添加）：TSNetworkMonitor.shared.addNetworkNotification(self, #selector(netChange))

3.获取当前网络状态：TSNetworkMonitor.shared.reachabilityStatus

3.关闭监听并移除通知： TSNetworkMonitor.shared.stopNotifier
