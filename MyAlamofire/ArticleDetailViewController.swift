//
//  ArticleDetailViewController.swift
//  MyAlamofire
//
//  Created by admin on 2020/12/3.
//

import Foundation
import UIKit
import SnapKit
import Alamofire


class ArticleDetailViewController: UIViewController {
    
    var section: Section?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var token: String = ""
        let user: UserDefaults = UserDefaults.standard
        if let tokenTmp = user.string(forKey: "token"){
            token = "Bearer " + tokenTmp
        }
        
//        let params = Params(id: id!, token: token!, markdown: markdown!)
        let headers: HTTPHeaders = [
            "Authorization": token,
            "Content-Type": "application/json"
        ]
        
        
        let url = "https://vcapi.lvdaqian.cn/article/" + section!.id! + "?markdown=false"

        AF.request(url, method: .get, headers: headers).responseString { response in  // 这里不能用responseJSON
//                print(response)
                switch response.result{
                case .success(let data):
//                    print("scuess: \(data)?")
                    let data = self.convertStringToDictionary(text: data)?["data"]
                    self.addView(data: data as? String)
                    break
                case .failure(let error):
                    print("error: \(error)")
                    break
                }
        }

    }
}

extension ArticleDetailViewController{
    func addView(data: String?){
        // 标题
        let textview = UITextView()
        self.view.addSubview(textview)
//            textview.layer.borderWidth = 1
//            textview.layer.borderColor = UIColor.gray.cgColor
        textview.text = self.section?.title
        textview.font = textview.font?.withSize(20)
        textview.isEditable = false
        
        textview.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalToSuperview().offset(20)
//            make.left.equalToSuperview().offset(20)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(<#T##amount: ConstraintOffsetTarget##ConstraintOffsetTarget#>)
        }
        
        
        let textView2 = UITextView()
        self.view.addSubview(textView2)
        textView2.text = data
        textView2.font = textView2.font?.withSize(10)
        textView2.isEditable = false
        
        textView2.snp.makeConstraints { (make) in
            make.size.equalTo(UIScreen.main.bounds.size)
            make.top.equalTo(textview.snp.bottom).offset(10)
            make.left.equalToSuperview()
        }
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
}
