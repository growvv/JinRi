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

struct Params: Encodable {
    let id: String
    let token: String
    let markdown: Bool
}


class ArticleDetailViewController: UIViewController {
    
    var id: String?
    var token: String?
    var markdown: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user: UserDefaults = UserDefaults.standard
        if let tokenTmp = user.string(forKey: "token"){
            token = tokenTmp
        }
        markdown = false
        
        let params = Params(id: id!, token: token!, markdown: markdown!)
        
        AF.request("https://vcapi.lvdaqian.cn/article",
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder.default).responseString { response in
            print(response)
            switch response.result{
            case .success(let data):
                print("scuess: \(data)")
                break
            case .failure(let error):
                print("error: \(error)")
                break
            }
    }
    }
}
