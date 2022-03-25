//
//  DropDownUI.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/25.
//

import UIKit
import DropDown

class DropDownUI {

    static func dropdownUI(dropdown: DropDown, dropField: UITextField) {
        dropdown.backgroundColor = UIColor.white
        dropdown.layer.cornerRadius = 8
        
        DropDown.appearance().setupCornerRadius(8)
        dropdown.dismissMode = .automatic
    }
    
    static func setDropDown(dropdown: DropDown, dropItem: [String], viewDrop: UIView, collectionView: UICollectionView, dropField: UITextField) {
        dropdown.dataSource = dropItem
        dropdown.anchorView = viewDrop
        
        dropdown.bottomOffset = CGPoint(x: 0, y: dropdown.bounds.height)
        dropdown.selectionAction = { index, item in
            collectionView.reloadData()
            dropField.text = item
            print("--> \(item)")
        }
        dropdown.cancelAction = {}
    }
}
