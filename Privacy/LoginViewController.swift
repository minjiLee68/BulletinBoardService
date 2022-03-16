//
//  LoginViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/09.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var IdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldStyle()
        btnStyle()
    }
    
    func textFieldStyle() {
        UITextField.textField(email: IdTextField, password: passwordTextField)
    }
    
    func btnStyle() {
        loginButton.layer.cornerRadius = 5
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = IdTextField.text, let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if user != nil {
                self.staySignedIn(email: email, password: password)
                guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "profileSetting") as? ProfileSettingViewController else { return }
                dvc.modalTransitionStyle = .coverVertical
                dvc.modalPresentationStyle = .fullScreen
                self.present(dvc, animated: true, completion: nil)
            } else {
                print("로그인 실패")
            }
        }
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUp") as? SignUpViewController else { return }
        signUpVC.modalPresentationStyle = .fullScreen
        signUpVC.modalTransitionStyle = .coverVertical
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    func staySignedIn(email: String, password: String) {
        let ud = UserDefaults.standard
        ud.set(email, forKey: "email")
        ud.set(password, forKey: "password")
        ud.set(true, forKey: "login")
    }
}
