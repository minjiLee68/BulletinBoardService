//
//  ProgressBar.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    static func textField(email: UITextField, password: UITextField) {
        email.addLeftPadding()
        email.layer.borderWidth = 1
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.layer.cornerRadius = 5
        email.borderStyle = .none
        password.addLeftPadding()
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.cornerRadius = 5
        password.borderStyle = .none
    }
}
