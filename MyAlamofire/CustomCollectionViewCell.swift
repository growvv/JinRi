//
//  CustomCollectionViewCell.swift
//  MyAlamofire
//
//  Created by admin on 2020/12/4.
//

import Foundation
import UIKit
import SnapKit

class CustomCell: UICollectionViewCell {
    
    var data: Section?{
        didSet{
            let showView = ShowView(frame: .zero, section: data!)
            contentView.addSubview(showView)
//            showView.layer.borderWidth = 1
//            showView.layer.borderColor = UIColor.gray.cgColor
            showView.snp.makeConstraints { (make) in
                make.size.equalToSuperview()
            }
            
            /* UIView继承于UIResponder是没有addTarget 方法的，所有只能在UIView上添加手势UITapGestureRecognizer来实现点击事件*/
            showView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
            tapGesture.numberOfTapsRequired = 1
            tapGesture.delegate = self
            showView.addGestureRecognizer(tapGesture)
        }
    }

    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        print("111")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// 手势冲突：允许两个手势识别器同时生效
// 解决的textview不响应的问题
extension CustomCell: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
}

extension CustomCell{

    @objc  func tapGestureAction(){
        print("跳转到文章详情页")
//        print(data)
        
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            
            print("navigation")
            let user: UserDefaults = UserDefaults.standard
            if let token = user.string(forKey: "token"){  // 有的话直接跳到公告页
                print(token)
                let articleView = ArticleDetailViewController()
                articleView.section = data

                navigationController.pushViewController(articleView, animated: true)
            }
            else{  // 没有token的话跳到登录页面
                let loginView = LoginViewController()
                navigationController.pushViewController(loginView, animated: true)
            }
//            let loginView = LoginViewController()
//            navigationController.pushViewController(loginView, animated: true)
        }
        
    }
}
