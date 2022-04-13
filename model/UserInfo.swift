//
//  UserInfo.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/16.
//

import UIKit
import FirebaseFirestoreSwift

struct UserInfo: Codable {
//    @DocumentID var id: String?
    var nickName: String
    var language: String
    var job: String
    var profile: URL
    
    mutating func update(nickName: String,language: String, job: String, profile: URL) {
        self.nickName = nickName
        self.language = language
        self.job = job
        self.profile = profile
    }
}

