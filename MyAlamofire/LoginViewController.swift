//
//  LoginViewController.swift
//  MyAlamofire
//
//  Created by admin on 2020/12/2.
//

import Foundation
import UIKit
import SnapKit
import Alamofire


class LoginViewController: UIViewController {
        
    var textField1: UITextField?
    var textField2: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "登录"
        
        let label1 = UILabel()
        label1.text = "账号"
        label1.textColor = .black
        label1.font = UIFont.systemFont(ofSize: 18.0)
        label1.layer.masksToBounds = true
        label1.layer.borderWidth = 1
        label1.layer.borderColor = UIColor.black.cgColor
        label1.textAlignment = .center
        self.view.addSubview(label1)
        label1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(25)
            make.width.equalTo(70)
            make.height.equalTo(40)
        }

        let label2 = UILabel()
        label2.text = "密码"
        label2.textColor = .black
        label2.font = UIFont.systemFont(ofSize: 18.0)
        label2.layer.masksToBounds = true
        label2.layer.borderWidth = 1
        label2.layer.borderColor = UIColor.black.cgColor
        label2.textAlignment = .center
        self.view.addSubview(label2)
        label2.snp.makeConstraints { (make) in
            make.top.equalTo(label1.snp.bottom).offset(20)
            make.left.equalTo(label1.snp.left)
            make.width.equalTo(70)
            make.height.equalTo(40)
        }

        textField1 = UITextField()
//        textField1.backgroundColor = .gray
        textField1!.borderStyle = .roundedRect//textField切圆角
        textField1!.placeholder = "请输入用户名"
        textField1!.clearsOnBeginEditing = true
        textField1!.font = UIFont.systemFont(ofSize: 20.0)
        textField1!.autocorrectionType = .no  //关闭系统自动联想
        textField1!.autocapitalizationType = .none  //关闭首字母大写
        self.view.addSubview(textField1!)
        textField1!.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.top.equalTo(label1.snp.top)
            make.left.equalTo(label1.snp.right).offset(20)
        }

        textField2 = UITextField()
//        textField2.backgroundColor = .gray
        textField2!.borderStyle = .roundedRect
        textField2!.placeholder = "请输入密码"
        textField2!.clearsOnBeginEditing = true
        textField2!.isSecureTextEntry = true
        textField2!.font = UIFont.systemFont(ofSize: 20.0)
        textField2!.autocorrectionType = .no  //关闭系统自动联想
        textField2!.autocapitalizationType = .none  //关闭首字母大写
        self.view.addSubview(textField2!)
        textField2!.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.top.equalTo(label2.snp.top)
            make.left.equalTo(label2.snp.right).offset(20)
        }
        

        let button1 = UIButton(frame: CGRect(x: 70, y: 370, width: 100, height: 40))
        button1.backgroundColor = .gray
        button1.setTitle("登录", for: .normal)
        button1.setTitleColor(.blue, for: .normal)
        button1.setTitleColor(.gray, for: .highlighted)  // 按下去的时候改成背景色
        button1.layer.cornerRadius = 9
        button1.layer.masksToBounds = true
        button1.titleLabel?.font = UIFont .systemFont(ofSize: 20.0)
        self.view.addSubview(button1)
        button1.snp.makeConstraints { (make) in
            make.top.equalTo(label2.snp.bottom).offset(40)
            make.left.equalTo(label2.snp.left).offset(40)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        button1.addTarget(self, action: #selector(login), for: .touchDown)

        let button2 = UIButton(frame: CGRect(x: 230, y: 370, width: 100, height: 40))
        button2.backgroundColor = .gray
        button2.setTitle("注册", for: .normal)
        button2.setTitleColor(.blue, for: .normal)
        button2.setTitleColor(.gray, for: .highlighted)
        button2.layer.cornerRadius = 9
        button2.layer.masksToBounds = true
        button2.titleLabel?.font = UIFont .systemFont(ofSize: 20.0)
        self.view.addSubview(button2)
        button2.snp.makeConstraints { (make) in
            make.top.equalTo(button1.snp.top)
            make.left.equalTo(button1.snp.right).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    @objc func login(){
        
//        var username: String
//        var password: String
        if let username = textField1?.text, let password = textField2?.text{
            let login = ["username": username, "password": password]

            AF.request("https://vcapi.lvdaqian.cn/login",
                       method: .post,
                       parameters: login,
                       encoder: JSONParameterEncoder.default).responseJSON { response in
                print(response)
                switch response.result{
                case .success(let json):
//                    print(json)
                    if let dictionary = json as? [String: Any] {
                        if let message = dictionary["message"] as? String, let token = dictionary["token"] as? String {
                            print(message)
                            print(token)
                            
                            let user: UserDefaults = UserDefaults.standard
                            user.set(token, forKey: "token")
                            
                            let gotToken = user.string(forKey: "token")
                            print("gotToken: \(String(describing: gotToken))")
                        }
                    }
                    break
                case .failure(let error):
                    print("error: \(error)")
                    break
                }
            }
        }
    }
    
    
}
