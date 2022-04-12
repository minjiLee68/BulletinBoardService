//
//  NewEditerViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit

class NewEditerViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var titleText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.addLeftPadding()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
