//
//  ShowView.swift
//  MyAlamofire
//
//  Created by admin on 2020/12/1.
//

import Foundation
import SnapKit

class ShowView: UIView {
    var type: Int?
    var title: String?
    var text: String?
    var images: [String]?
    var singleImage: String?
    

    init(frame: CGRect, section: Section) {
        self.type = section.type
        self.title = section.title
        self.text = section.title
        self.images = section.images
        if let tmpimage = images?[0]{
            self.singleImage = tmpimage
        }
        
        super.init(frame: frame)

        if type == 0{
            // 创建多行文本控件
            let textview = UITextView()
            self.addSubview(textview)
//            textview.layer.borderWidth = 1
//            textview.layer.borderColor = UIColor.gray.cgColor
            textview.text = title
            textview.font = textview.font?.withSize(20)
            textview.isEditable = false
            
            textview.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalToSuperview()
                make.top.equalTo(self.snp.top)
            }
        }
        else if type == 1{
            let textview = UITextView()
            self.addSubview(textview)
            textview.text = text
            textview.font = textview.font?.withSize(20)
            textview.isEditable = false
            
            textview.snp.makeConstraints { (make) in
                make.width.equalToSuperview().multipliedBy(0.66)
                make.height.equalToSuperview()
                make.top.equalTo(self.snp.top)
                make.left.equalToSuperview()
            }
            
            let uiimage = UIImage(named: self.singleImage!)
            let imageview = UIImageView(image: uiimage)
            self.addSubview(imageview)
            
            imageview.snp.makeConstraints { (make) in
                make.width.equalToSuperview().multipliedBy(0.34)
                make.height.equalToSuperview()
                make.top.equalTo(self.snp.top)
                make.left.equalTo(textview.snp.right)
            }
        }
        else if type == 2{
            let uiimage = UIImage(named: self.singleImage!)
            let imageview = UIImageView(image: uiimage)
            self.addSubview(imageview)
            
            imageview.snp.makeConstraints { (make) in
                make.width.equalToSuperview().multipliedBy(0.34)
                make.height.equalToSuperview()
                make.top.equalTo(self.snp.top)
                make.left.equalToSuperview()
                
            }
            
            let textview = UITextView()
            self.addSubview(textview)
            textview.text = text
            textview.font = textview.font?.withSize(20)
            textview.isEditable = false
            
            textview.snp.makeConstraints { (make) in
                make.width.equalToSuperview().multipliedBy(0.66)
                make.height.equalToSuperview()
                make.top.equalTo(self.snp.top)
                make.left.equalTo(imageview.snp.right)
            }
        }
        else if type == 3{
            let textview = UITextView()
            self.addSubview(textview)
            textview.text = text
            textview.font = textview.font?.withSize(20)
            textview.isEditable = false
            
            textview.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.3)
                make.top.equalToSuperview()
                make.left.equalToSuperview()
            }
            
            let uiimage = UIImage(named: self.singleImage!)
            let imageview = UIImageView(image: uiimage)
            self.addSubview(imageview)

            imageview.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.7)
                make.bottom.equalToSuperview()
                make.left.equalToSuperview()

            }
        }
        else if type == 4{
            let textview = UITextView()
            self.addSubview(textview)
            textview.text = text
            textview.font = textview.font?.withSize(20)
            textview.isEditable = false
            
            textview.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.3)
                make.top.equalToSuperview()
                make.left.equalToSuperview()
            }
            
            var alignLeft = self.snp.left
            for image in images!{
//                var imageview: UIImageView?
                let uiimage = UIImage(named: image)
                let imageview = UIImageView(image: uiimage)
                self.addSubview(imageview)

                imageview.snp.makeConstraints { (make) in
                    make.width.equalToSuperview().dividedBy(images!.count)
                    make.height.equalToSuperview().multipliedBy(0.7)
                    make.bottom.equalToSuperview()
                    make.left.equalTo(alignLeft)
                }
                alignLeft = imageview.snp.right
            }
            
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
