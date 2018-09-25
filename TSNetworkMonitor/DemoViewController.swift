//
//  DemoViewController.swift
//  TSNetworkMonitor
//
//  Created by 小铭 on 2018/9/25.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    private var contentView = UIView.init(frame: CGRect(x: 30, y: 30, width: 100, height: 500))
    private var clickBtn = UIButton.init(type: .custom)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        contentView.backgroundColor = TSNetworkMonitor.shared.reachabilityStatus == TSListenerStatus.tsNoNet ? .red : .green
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

//        TSNetworkMonitor.shared.startMonitor { [weak self ] (status) in
//            self?.contentView.backgroundColor = status ? .green : .red
//        }
        view.addSubview(contentView)
        // Do any additional setup after loading the view.
        view.addSubview(clickBtn)
        clickBtn.frame = CGRect(x: 130, y: 200, width: 50, height: 50)
        clickBtn.backgroundColor = .cyan
        clickBtn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        TSNetworkMonitor.shared.addNetworkNotification(self, #selector(netChange(nofi:)))
    } 

    @objc func netChange(nofi : Notification) {
        //        let str : Bool = nofi.userInfo!["networkStatus"] as? Bool
        if TSNetworkMonitor.shared.reachabilityStatus == TSListenerStatus.tsNoNet {
            contentView.backgroundColor = .red
        } else {
            contentView.backgroundColor = .green
        }
    }
    
    @objc func onClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
