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
    
    let viewModel = ProfileViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getData() { name in
            self.name.text = name
        }
        UIViewStyle.viewStyle(view: viewBG)
    }
}

extension UIColor {
    class var primaryColor: UIColor? { return UIColor(named: "PrimaryColor") }
}
