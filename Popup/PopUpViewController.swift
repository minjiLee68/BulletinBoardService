//
//  PopUpViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/28.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var prepara: UIButton!
    @IBOutlet weak var officworkers: UIButton!
    @IBOutlet weak var student: UIButton!
    @IBOutlet weak var hobby: UIButton!
    
    @IBOutlet weak var shortterm: UIButton!
    @IBOutlet weak var longterm: UIButton!
    @IBOutlet weak var notyet: UIButton!
    
    @IBOutlet weak var ios: UIButton!
    @IBOutlet weak var android: UIButton!
    @IBOutlet weak var java: UIButton!
    
    @IBOutlet weak var chaird: UIButton!
    @IBOutlet weak var table: UIButton!
    @IBOutlet weak var notebook: UIButton!
    @IBOutlet weak var glasses: UIButton!
    
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
        print(a ?? " ")
        if prepara.isSelected == true {
            prepara.backgroundColor = UIColor.init(named: "PrimaryColor")
            job = prepara.titleLabel?.text
        } else if prepara.isSelected == false {
            prepara.backgroundColor = UIColor.clear
        }
        
        if officworkers.isSelected == true {
            officworkers.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if officworkers.isSelected == false {
            officworkers.backgroundColor = UIColor.clear
        }
        
        if student.isSelected == true {
            student.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if student.isSelected == false {
            student.backgroundColor = UIColor.clear
        }
        
        if hobby.isSelected == true {
            hobby.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if hobby.isSelected == false {
            hobby.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func term(_ sender: Any) {
        if shortterm.isSelected == true {
            shortterm.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if shortterm.isSelected == false {
            shortterm.backgroundColor = UIColor.clear
        }
        
        if longterm.isSelected == true {
            longterm.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if longterm.isSelected == false {
            longterm.backgroundColor = UIColor.clear
        }
        
        if notyet.isSelected == true {
            notyet.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if notyet.isSelected == false {
            notyet.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func language(_ sender: Any) {
        if ios.isSelected == true {
            ios.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if ios.isSelected == false {
            ios.backgroundColor = UIColor.clear
        }
        
        if android.isSelected == true {
            android.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if android.isSelected == false {
            android.backgroundColor = UIColor.clear
        }
        
        if java.isSelected == true {
            java.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if java.isSelected == false {
            java.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func etc(_ sender: Any) {
        if chaird.isSelected == true {
            chaird.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if chaird.isSelected == false {
            chaird.backgroundColor = UIColor.clear
        }
        
        if table.isSelected == true {
            table.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if table.isSelected == false {
            table.backgroundColor = UIColor.clear
        }
        
        if notebook.isSelected == true {
            notebook.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if notebook.isSelected == false {
            notebook.backgroundColor = UIColor.clear
        }
        
        if glasses.isSelected == true {
            glasses.backgroundColor = UIColor.init(named: "PrimaryColor")
        } else if glasses.isSelected == false {
            glasses.backgroundColor = UIColor.clear
        }
    }
}
