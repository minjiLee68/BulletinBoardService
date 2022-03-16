//
//  SignUpViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit
import FirebaseAuth

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
        UITextField.textField(email: idTextField, password: passwordTextField)
    }
    
    func btnStyle() {
        signUpBtn.layer.cornerRadius = 5
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        guard let email = idTextField.text, let password = passwordTextField.text else { return }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print("실패 \(e.localizedDescription)")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
