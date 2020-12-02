//
//  GetData.swift
//  MyAlamofire
//
//  Created by admin on 2020/12/2.
//

import Foundation

public struct Section {

    var type: Int?
    var title: String?
    var text: String?
    var images: [String]?
    var singleImage: String?
    var id: String?
    var author: String?
    var publishTime: String?
    
    public init(type: Int?, title: String?, text: String?, images: [String]?, singleImage: String?, id: String?, author: String?, publishTime: String?) {
        self.type = type
        self.title = title
        self.text = text
        self.images = images
        self.singleImage = singleImage
        self.id = id
        self.author = author
        self.publishTime = publishTime
    }
}


class GetData {
//    var section: Section
    
    var sections: [Section] = []
    
    init() {
//        print("init")
        let path = Bundle.main.path(forResource: "metadata", ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
            
            if let jsonRes = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]{
                for arr in jsonRes{
                    //print(arr)
                    var section: Section = Section(type: nil, title: nil, text: nil, images: nil, singleImage: nil, id: nil, author: nil, publishTime: nil)
                    for item in arr{
                        //print("\(item.key) \(item.value)")
                        if item.key == "id"{
                            section.id = item.value as? String
                        }
                        if item.key == "title"{
                            section.title = item.value as? String
                        }
                        if item.key == "author"{
                            section.author = item.value as? String
                        }
                        if item.key == "publishTime"{
                            section.publishTime = item.value as? String
                        }
                        if item.key == "type"{
                            section.type = item.value as? Int
                        }
                        if item.key == "cover"{
                            section.singleImage = item.value as? String
                        }
                        if item.key == "covers"{
                            section.images = item.value as? [String]
                        }
                    }
//                    print(section)
                    sections.append(section)
                }
            }
        } catch {
            print("error")
        }
    }
}
