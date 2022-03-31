//
//  PopUpViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/28.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    
    var job: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewStyle()
    }
    
    func viewStyle() {
        viewBG.layer.cornerRadius = 20
        viewBG.clipsToBounds = true
        viewBG.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func preparation(_ sender: UIButton) {
        let a = sender.titleLabel?.text
        print(a ?? "nil")
        if sender.isSelected == true {
            sender.backgroundColor = UIColor.init(named: "PrimaryColor")
            job = sender.titleLabel?.text
        } else if sender.isSelected == false {
            sender.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func term(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if sender.isSelected == false {
            sender.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func language(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if sender.isSelected == false {
            sender.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func etc(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if sender.isSelected == false {
            sender.backgroundColor = UIColor.clear
        }
    }
}
