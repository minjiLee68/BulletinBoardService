//
//  dietViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/16.
//

import UIKit

class LanguageViewModel {
    static let shared = LanguageViewModel()
    var swiftItem: [String] = ["Swift 기초문법", "Swift 심화학습", "Swift로 앱만들기", "8282 Swift"]
    
    var swiftImage: [String] = ["it-Android", "it-swift", "it-java", "it-kotlin"]
    
    var SWnumOfItems: Int{
        return swiftItem.count
    }
    
    var KotlinItem: [String] = ["Kotlin 기초문법", "Kotlin 심화학습", "Kotlin으로 앱만들기", "8282 Kotlin"]
    
    var KotlinImage: [String] = ["it-Android", "it-swift", "it-java", "it-kotlin"]
    
    var ktnumOfItems: Int{
        return swiftItem.count
    }
    
    var JavaItem: [String] = ["Java 기초문법", "Java 심화학습", "Java로 앱만들기", "8282 Java"]
    
    var JavaImage: [String] = ["it-Android", "it-swift", "it-java", "it-kotlin"]
    
    var JVnumOfItems: Int{
        return swiftItem.count
    }
}
