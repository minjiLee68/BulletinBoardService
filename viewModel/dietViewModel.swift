//
//  dietViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/16.
//

import UIKit

class dietViewModel {
    static let shared = dietViewModel()
    var items: [String] = ["diet1", "diet2", "diet3", "diet4"]
    
    var itemText: [String] = ["벌크업", "리맨스업", "다이어트", "간헐적 단식"]
    
    var numOfItems: Int{
        return items.count
    }
}
