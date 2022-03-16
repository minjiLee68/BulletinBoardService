//
//  UserInfo.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/16.
//

import UIKit

struct UserInfo {
    var nickName: String
    var kg: String
    var cm: String
    var porpuse: String
    var profile: UIImage
    
    init(nickName: String, kg: String, cm: String, porpuse: String, profile: UIImage) {
        self.nickName = nickName
        self.kg = kg
        self.cm = cm
        self.porpuse = porpuse
        self.profile = profile
    }
}
