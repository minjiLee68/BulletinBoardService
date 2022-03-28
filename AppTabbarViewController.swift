//
//  AppTabbarViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/28.
//

import UIKit

class AppTabbarViewController: UITabBarController {

    //화면 회전
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
