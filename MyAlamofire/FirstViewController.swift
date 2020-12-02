//
//  FirstViewController.swift
//  MyAlamofire
//
//  Created by admin on 2020/12/1.
//

import Foundation
 
import UIKit
//定义一个全局变量,用来记录当前显示器的编号
var pageNum = 0
 
class FirstViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            //        每次当前视图控制器创建一次，全局变量加一
            pageNum = pageNum + 1
            //        根据当前的全局变量名设置标题
            self.title = "Page\(pageNum)"
            self.view.backgroundColor = UIColor.purple
            //        添加一个页面跳转按钮
            let push = UIButton(frame: CGRect(x: 40, y: 120, width: 240, height: 40))
            push.setTitle("Push page", for: UIControl.State())
            push.backgroundColor = UIColor.orange
            push.addTarget(self, action: #selector(pushPage), for: UIControl.Event.touchUpInside)
            self.view.addSubview(push)
            
            //        添加一个按钮，点击时返回上一个页面
            let pop = UIButton(frame: CGRect(x: 40, y: 180, width: 240, height: 40))
            pop.setTitle("Pop Page", for: UIControl.State())
            pop.backgroundColor = UIColor.orange
            pop.addTarget(self, action: #selector(popPage), for: UIControl.Event.touchUpInside)
            self.view.addSubview(pop)
            
            //        添加一个按钮，点击时跳转到指定序号的页面
            let index = UIButton(frame: CGRect(x: 40, y: 280, width: 240, height: 40))
            index.setTitle("Goto Index Page", for: UIControl.State())
            index.backgroundColor = UIColor.orange
            index.addTarget(self, action: #selector(gotoIndexPage), for: UIControl.Event.touchUpInside)
            self.view.addSubview(index)
            
            //        添加一个按钮，点击时跳转到根视图
            let root = UIButton(frame: CGRect(x: 40, y: 340, width: 240, height: 40))
            root.setTitle("Goto root Page", for: UIControl.State())
            root.backgroundColor = UIColor.orange
            root.addTarget(self, action: #selector(gotoRootPage), for: UIControl.Event.touchUpInside)
            self.view.addSubview(root)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    创建第一个按钮绑定的方法打开页面（入栈）
    @objc func pushPage(){
        //        实例化第二个视图控制器
        let viewController = FirstViewController()
        //        把视图压入导航视图
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    //    第二个按钮的方法，将导航视图控制器从堆栈中移除
    @objc func popPage(){
        self.navigationController?.popViewController(animated: true)
    }
    //    第三个按钮绑定的方法，根据全局序号，查找堆栈中指定序号的视图控制器
    @objc func gotoIndexPage(){
        let viewController = self.navigationController?.viewControllers[1]
        self.navigationController?.popToViewController(viewController!, animated: true)
    }
    //    创建第四个按钮绑定的方法,所有子视图出栈
    @objc func gotoRootPage(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
