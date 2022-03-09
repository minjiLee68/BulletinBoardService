//
//  LoginViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/09.
//

import UIKit

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
        IdTextField.addLeftPadding()
        IdTextField.borderStyle = .roundedRect
        passwordTextField.addLeftPadding()
        passwordTextField.borderStyle = .roundedRect
    }
    
    func btnStyle() {
        loginButton.layer.cornerRadius = 5
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUp") as? SignUpViewController else { return }
        signUpVC.modalPresentationStyle = .fullScreen
        signUpVC.modalTransitionStyle = .coverVertical
        self.present(signUpVC, animated: true, completion: nil)
    }
}

//extension UITextField {
//    func addLeftPadding() {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
//        self.leftView = paddingView
//        self.leftViewMode = ViewMode.always
//    }
//}
