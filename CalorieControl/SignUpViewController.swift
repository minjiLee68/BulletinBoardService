//
//  SignUpViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldStyle()
        btnStyle()
    }
    
    func textFieldStyle() {
        idTextField.addLeftPadding()
        idTextField.borderStyle = .roundedRect
        passwordTextField.addLeftPadding()
        passwordTextField.borderStyle = .roundedRect
    }
    
    func btnStyle() {
        signUpBtn.layer.cornerRadius = 5
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
