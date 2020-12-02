//
//  DestinationViewController.swift
//  MyAlamofire
//
//  Created by admin on 2020/12/1.
//

import UIKit


class DestinationViewController: UIViewController {

    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        initBtn()
        print(message!)
    }
    //初始化返回按钮，点击按钮返回主页面。
    func initBtn() {
        let screenSize = UIScreen.main.bounds.size
        let jumpBtn = UIButton(type: .system)
        jumpBtn.setTitle("返回", for: .normal)
        jumpBtn.frame = CGRect(x: screenSize.width / 2 - 50, y: screenSize.height - 50, width: 100, height: 30)
        jumpBtn.backgroundColor = .red
        jumpBtn.setTitleColor(UIColor.white, for: .normal)
        //按钮绑定事件
        jumpBtn.addTarget(self, action: #selector(pageReturn), for: .touchDown)
        self.view.addSubview(jumpBtn)
    }
    
    @objc func pageReturn() {
        print("dest to main")
        //返回主页面
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
