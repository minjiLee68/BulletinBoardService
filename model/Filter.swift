//
//  Filter.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/28.
//

import UIKit

struct Filter: Codable {
    var job: String
    var langauge: String
    var trem: String
    var etc: String
    
    mutating func update(job: String, lan: String, trem: String, etc: String) {
        self.job = job
        self.langauge = lan
        self.trem = trem
        self.etc = etc
    }
}
