//
//  Reply.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit

struct Board: Codable {
    var id: String = ""
    var title: String
    var contents: String
    var time: String
    
    init(id: String, title: String, contents: String) {
        self.id = id
        self.title = title
        self.contents = contents
        self.time = "04/12"
    }
//
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.id == rhs.id
//    }
}
