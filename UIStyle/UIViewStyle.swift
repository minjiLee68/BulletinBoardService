//
//  UIViewStyle.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/11.
//

import UIKit

class UIViewStyle {
    static func viewStyle(view: UIView) {
        view.layer.cornerRadius = 15
        view.layer.shadowOffset = CGSize(width: -2, height: 0)
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = 5
        view.layer.masksToBounds = false
    }
    
    static func collectionViewStyle(collectionView: UICollectionView) {
        collectionView.layer.cornerRadius = 15
        collectionView.layer.shadowOffset = CGSize(width: -2, height: 0)
        collectionView.layer.shadowOpacity = 0.15
        collectionView.layer.shadowRadius = 5
    }
}
