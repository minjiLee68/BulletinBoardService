//
//  MainViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/09.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UIViewStyle.viewStyle(view: viewBG)
    }
}

extension UIColor {
    class var primaryColor: UIColor? { return UIColor(named: "PrimaryColor") }
}
