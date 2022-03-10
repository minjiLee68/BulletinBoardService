//
//  ImageViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit

class ImageViewModel {
    private var items: [DietImage] = []
    
    var numOfItems: Int {
        return items.count
    }
    
    func item(at index: Int) -> DietImage {
        return items[index]
    }
}

class DietFetcher {
    static func fetch() -> [DietImage] {
        let image = (1..<5).map{DietImage(dietImage: UIImage(named: "diet\($0)")!)}
        return image
    }
}
        
struct DietImage {
    let dietImage: UIImage
}
