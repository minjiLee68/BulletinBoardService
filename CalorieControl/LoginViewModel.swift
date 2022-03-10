//
//  LoginViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit

class LoginViewModel {
    static let shared = LoginViewModel()
    
    var email: String = {
        return UserDefaults.standard.string(forKey: "email")
    }() ?? "nil"
    
    var password: String = {
        return UserDefaults.standard.string(forKey: "password")
    }() ?? "nil"
    
    var isLogin: Bool = {
        return UserDefaults.standard.bool(forKey: "login")
    }()
}
