//
//  dietViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/16.
//

import UIKit

class LanguageViewModel {
    static let shared = LanguageViewModel()
    var swiftItem: [String] = ["Swift 기초문법", "Swift 심화학습", "Swift로 앱만들기", "빠르게 배우는 Swift"]
    
    var swiftImage: [String] = ["Android", "swifr", "java", "kotlin"]
    
    var SWnumOfItems: Int{
        return swiftItem.count
    }
}
