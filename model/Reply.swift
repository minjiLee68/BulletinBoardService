//
//  Reply.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/19.
//

import UIKit

struct Reply: Codable {
    var id: String
    var nickName: String
    var reply: String
    var time: Date
    
    init(id: String, nickName: String, reply: String) {
        self.id = id
        self.nickName = nickName
        self.reply = reply
        self.time = Date()
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case nickName
        case reply
        case time
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(String.self, forKey: .id)
//        nickName = try values.decode(String.self, forKey: .nickName)
//        reply = try values.decode(String.self, forKey: .reply)
//        let sendDate = try values.decode(Double.self, forKey: .time)
//        time = Date(timeIntervalSince1970: sendDate)
//    }
    
    //Date 형을 firestore에 입력하면 Unix Time Stamp형으로 변환되므로 decode형식 변환이 필요
    //Codable은 CodingKeys 프로퍼티와 init(from decoder: Decoder) 생성자가 내부적으로 불리고 있는데, 이곳에서 init(from decoder: Decoder)를 재정의해주면 해결 가능
}

//extension Reply: Comparable {
//    static func == (lhs: Reply, rhs: Reply) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//    static func < (lhs: Reply, rhs: Reply) -> Bool {
//        return lhs.time == rhs.time
//    }
//}
