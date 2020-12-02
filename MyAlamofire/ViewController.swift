//
//  ViewController.swift
//  MyAlamofire
//
//  Created by admin on 2020/11/30.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    var scrollView: UIScrollView?
    
    let numberOfButtons = 5
    let namesOfButton = ["关注", "推荐", "热榜", "上海", "小说"]
    
    let sections = 4    // 区块数目
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "今日头条"
        initScrollView()
        initList()
    }

    // 初始化导航栏
    func initScrollView(){
        scrollView = UIScrollView()
        scrollView?.layer.borderWidth = 1
        scrollView?.layer.borderColor = UIColor.gray.cgColor
        self.view.addSubview(scrollView!)

        scrollView!.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(18)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
                
        var alignLeft = scrollView!.snp.left   // 上一个Button的左边, ConstraintItem类型
        for index in 0..<self.numberOfButtons {
            let button = UIButton()
            scrollView!.addSubview(button)
                
            button.snp.makeConstraints { (make) in
                make.height.equalToSuperview()
                make.width.equalToSuperview().dividedBy(self.numberOfButtons)
                make.left.equalTo(alignLeft)
            }
            alignLeft = button.snp.right

            button.setTitle(namesOfButton[index], for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.blue, for: .selected)
            button.addTarget(self, action: #selector(pageJump), for: .touchDown)
            
        }
    }
    
    
    @objc func pageJump() {
        print("main to dest")
        //创建一个页面
        let destination = DestinationViewController()
        //取目标页面的一个变量进行赋值，以属性的方式进行传值。
        destination.message = "传递的信息"
        
        let first = FirstViewController()
        
        //跳转
        self.navigationController?.pushViewController(first, animated: true)
    }
    
    // 展示5种View
    func initList() {
        
        let safeheight = self.view.safeAreaLayoutGuide.layoutFrame.size.height
        var alignTop = scrollView!.snp.top
        
        for index in 0..<self.sections{
            // type 0
            let typeView = ShowView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), section: sectionsData[index])
            self.view.addSubview(typeView)
            typeView.layer.borderWidth = 1
            typeView.layer.borderColor = UIColor.gray.cgColor
            
            
            typeView.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
    //            make.height.equalTo(150)
                make.height.equalTo(safeheight/5)
                make.top.equalTo(alignTop)
            }
            alignTop = typeView.snp.bottom
        }
        
//        // type 0
//        let typeView0 = ShowView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), type: 0, title: "标题", text: "使用background属性可以设置输入框的", images: nil)
//        self.view.addSubview(typeView0)
//        typeView0.layer.borderWidth = 1
//        typeView0.layer.borderColor = UIColor.gray.cgColor
//
//
//        typeView0.snp.makeConstraints { (make) in
//            make.width.equalToSuperview()
////            make.height.equalTo(150)
//            make.height.equalTo(safeheight/5)
//            make.top.equalTo(scrollView!.snp.bottom)
//        }
//
//
//
//        // type 1
//        let typeView1 = ShowView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), type: 1, title: "标题", text: "巡洋计划", images: ["event_02"])
//        self.view.addSubview(typeView1)
//        typeView1.layer.borderWidth = 1
//        typeView1.layer.borderColor = UIColor.gray.cgColor
//
//        typeView1.snp.makeConstraints { (make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(safeheight/5)
//            make.top.equalTo(typeView0.snp.bottom)
//        }
//
//        // type 2
//        let typeView2 = ShowView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), type: 2, title: "标题", text: "合照", images: ["tb09_1"])
//        self.view.addSubview(typeView2)
//        typeView2.layer.borderWidth = 1
//        typeView2.layer.borderColor = UIColor.gray.cgColor
//
//        typeView2.snp.makeConstraints { (make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(safeheight/5)
//            make.top.equalTo(typeView1.snp.bottom)
//        }
//
//        // type 3
//        let typeView3 = ShowView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), type: 4, title: "标题", text: "划船", images: ["tb09_1", "tb09_2", "tb09_3", "tb09_4"])
//        self.view.addSubview(typeView3)
//        typeView3.layer.borderWidth = 1
//        typeView3.layer.borderColor = UIColor.gray.cgColor
//
//        typeView3.snp.makeConstraints { (make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(safeheight/5)
//            make.top.equalTo(typeView2.snp.bottom)
//        }
    }
}

