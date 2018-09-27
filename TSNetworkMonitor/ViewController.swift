//
//  ViewController.swift
//  TSNetworkMonitor
//
//  Created by 小铭 on 2018/9/25.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var contentView = UIView.init(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
    private var clickBtn = UIButton.init(type: .custom)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        contentView.backgroundColor = TSNetworkMonitor.shared.reachabilityStatus == TSListenerStatus.tsNoNet ? .red : .green
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(contentView)
        view.addSubview(clickBtn)
        clickBtn.frame = CGRect(x: 130, y: 200, width: 50, height: 50)
        clickBtn.backgroundColor = .cyan
        clickBtn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        TSNetworkMonitor.shared.addNetworkNotificationBlock { (not) in
            if TSNetworkMonitor.shared.reachabilityStatus == TSListenerStatus.tsNoNet {
                self.contentView.backgroundColor = .red
            } else {
                self.contentView.backgroundColor = .green
            }
        }
    }

    @objc func netChange() {
        if TSNetworkMonitor.shared.reachabilityStatus == TSListenerStatus.tsNoNet {
            contentView.backgroundColor = .red
        } else {
            contentView.backgroundColor = .green
        }
    }
    
    @objc func onClick() {
        self.present(DemoViewController(), animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

