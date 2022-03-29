//
//  MainViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/09.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    let userInfoVM = UserInfoViewModel.shared
    let profileVM = ProfileViewModel.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userInfoVM.getData() { info in
            let name = info.nickName
            self.name.text = name + "님 환영합니다."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIViewStyle.viewStyle(view: viewBG)
        profileImg.clipsToBounds = true
    }
}

extension UIColor {
    class var primaryColor: UIColor? { return UIColor(named: "PrimaryColor") }
}
