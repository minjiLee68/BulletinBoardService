//
//  Filter.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/28.
//

import UIKit

struct Filter {
    var job: String
    var langauge: String
    var trem: String
    var etc: String
    
    init(job: String, lan: String, trem: String, etc: String) {
        self.job = job
        self.langauge = lan
        self.trem = trem
        self.etc = etc
    }
}
