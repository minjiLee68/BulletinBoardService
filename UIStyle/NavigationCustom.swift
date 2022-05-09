//
//  NavigationCustom.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/05/07.
//

import UIKit

class NavigationCustom {
    static func navigationCustomUI(_ navigationController: UINavigationController?, title: String) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primaryColor!]
        navigationController?.navigationItem.rightBarButtonItem?.tintColor = .primaryColor
        navigationController?.navigationItem.leftBarButtonItem?.tintColor = .primaryColor
        navigationController?.navigationItem.title = title
    }
}
