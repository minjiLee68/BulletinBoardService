//
//  Reply.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/19.
//

import UIKit

struct Reply: Codable, Equatable {
    var id: String
    var nickName: String
    var reply: String
    var time: String
    
    mutating func update(id: String, nickName: String, reply: String) {
        self.id = id
        self.nickName = nickName
        self.reply = reply
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
