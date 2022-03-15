//
//  ProfileSettingViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/15.
//

import UIKit

class ProfileSettingViewController: UIViewController {
    @IBOutlet weak var porpusePicker: UITextField!
    var selectCity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ProfileSettingViewController: UIPickerViewDelegate {
    
}
