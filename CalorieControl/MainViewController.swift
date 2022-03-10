//
//  MainViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/09.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var viewBG: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewBG.layer.cornerRadius = 15
    }
   
}
