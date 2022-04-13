//
//  Reply.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit

struct Board: Codable, Equatable {
    var id: Int = 0
    var title: String
    var contents: String
    var time: String
    
    mutating func update(title: String, contents: String, time: String) {
        self.title = title
        self.contents = contents
        self.time = time
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
