//
//  ViewController.swift
//  MyAlamofire
//
//  Created by admin on 2020/11/30.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    var scrollViewHeader: UIScrollView?
    var scrollViewBody: UIScrollView?
    
    let numberOfButtons = 5
    let namesOfButton = ["关注", "推荐", "热榜", "上海", "科技"]
    
    let sectionsNumber = 5    // 区块的数目
    let sectionHeight = 180   // 区块的高度
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "今日头条"
        
        initScrollView()
        initList()
//        initEdit()
    }

    // 初始化导航栏
    func initScrollView(){
        scrollViewHeader = UIScrollView()
        scrollViewHeader?.layer.borderWidth = 1
        scrollViewHeader?.layer.borderColor = UIColor.gray.cgColor
        self.view.addSubview(scrollViewHeader!)

        scrollViewHeader!.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(18)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
                
        var alignLeft = scrollViewHeader!.snp.left   // 上一个Button的左边, ConstraintItem类型
        for index in 0..<self.numberOfButtons {
            let button = UIButton()
            scrollViewHeader!.addSubview(button)
                
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
    
    
    // 展示5种View
    func initList() {

        scrollViewBody = UIScrollView(frame: CGRect(x: 100, y: 200, width: 100, height: 1000))
//        scrollViewBody?.contentSize = CGSize(width: 400, height: 1000)
//        scrollViewBody?.backgroundColor = .gray
//        scrollViewBody?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.view.addSubview(scrollViewBody!)

        scrollViewBody!.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
//            make.height.equalTo(self.sectionsNumber * self.sectionHeight)
            make.size.equalTo(self.view.safeAreaLayoutGuide)
            make.top.equalTo(scrollViewHeader!.snp.bottom)
            make.left.equalToSuperview()
//            make.bottom.trailing.equalToSuperview()
        }
        
        let contentView = UIView()
        scrollViewBody?.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
//            make.top.leading.bottom.trailing.equalToSuperview().inset(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.width.equalToSuperview()
            make.height.equalTo(self.sectionHeight * (self.sectionsNumber+1))
        }
        
        
//        let safeheight = self.view.safeAreaLayoutGuide.layoutFrame.size.height
        var alignTop = contentView.snp.top
        let sectionsData = GetData().sections  // 获取数据
//        print(sectionsData)
        
        for index in 0..<self.sectionsNumber{
            let typeView = ShowView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), section: sectionsData[index])
            contentView.addSubview(typeView)
            typeView.layer.borderWidth = 1
            typeView.layer.borderColor = UIColor.gray.cgColor
            
            
            typeView.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
    //            make.height.equalTo(150)
                make.height.equalTo(self.sectionHeight)
                make.top.equalTo(alignTop)
                make.left.equalToSuperview()
            }
            alignTop = typeView.snp.bottom

            /* UIView继承于UIResponder是没有addTarget 方法的，所有只能在UIView上添加手势UITapGestureRecognizer来实现点击事件。
            */
            typeView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
            tapGesture.numberOfTapsRequired = 1
            tapGesture.delegate = self
            typeView.addGestureRecognizer(tapGesture)

        }
    }

}


extension ViewController{

    @objc func pageJump() {
        print("main to dest")
//        //创建一个页面
//        let destination = DestinationViewController()
//        //取目标页面的一个变量进行赋值，以属性的方式进行传值。
//        destination.message = "传递的信息"
        
        let first = FirstViewController()
        
        //跳转
        self.navigationController?.pushViewController(first, animated: true)
    }
}



extension ViewController{

    @objc  func tapGestureAction(){
        print("跳转到文章详情页")
        let user: UserDefaults = UserDefaults.standard
        if let token = user.string(forKey: "token"){  // 有的话直接跳到公告页
            print(token)
            let articleView = ArticleDetailViewController()
            articleView.id = "event_01"
            self.navigationController?.pushViewController(articleView, animated: true)
        }
        else{  // 没有token的话跳到登录页面
            let loginView = LoginViewController()
            self.navigationController?.pushViewController(loginView, animated: true)
        }
    }
}

// 手势冲突：允许两个手势识别器同时生效
// 解决的textview不响应的问题
extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
}
