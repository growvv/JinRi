//
//  Data.swift
//  MyAlamofire
//
//  Created by admin on 2020/12/2.
//

import Foundation

//
// MARK: - Section Data Structure
//
public struct Section {

    var type: Int?
    var title: String?
    var text: String?
    var images: [String]?
    
    public init(type: Int?, title: String?, text: String?, images: [String]?) {
        self.type = type
        self.title = title
        self.text = text
        self.images = images
    }
}

public var sectionsData: [Section] = [
    Section(type: 0, title: "标题", text: "使用background属性可以设置输入框的", images: nil),
    Section(type: 1, title: "标题", text: "巡洋计划", images: ["event_02"]),
    Section(type: 2, title: "标题", text: "合照", images: ["tb09_1"]),
    Section(type: 3, title: "标题", text: "划船", images: ["tb09_2"]),
    Section(type: 4, title: "标题", text: "划船", images: ["tb09_1", "tb09_2", "tb09_3", "tb09_4"]),
    Section(type: 0, title: "标题", text: "使用background属性可以设置输入框的", images: nil),
    Section(type: 1, title: "标题", text: "巡洋计划", images: ["event_02"]),
    Section(type: 2, title: "标题", text: "合照", images: ["tb09_1"]),
    Section(type: 3, title: "标题", text: "划船", images: ["tb09_2"]),
    Section(type: 4, title: "标题", text: "划船", images: ["tb09_1", "tb09_2", "tb09_3", "tb09_4"])
]
