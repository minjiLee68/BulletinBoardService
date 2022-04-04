//
//  PopUpViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/28.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var p1: UIButton!
    @IBOutlet weak var p2: UIButton!
    @IBOutlet weak var p3: UIButton!
    @IBOutlet weak var p4: UIButton!
    
    @IBOutlet weak var t1: UIButton!
    @IBOutlet weak var t2: UIButton!
    @IBOutlet weak var t3: UIButton!
    
    @IBOutlet weak var l1: UIButton!
    @IBOutlet weak var l2: UIButton!
    @IBOutlet weak var l3: UIButton!
    
    @IBOutlet weak var e1: UIButton!
    @IBOutlet weak var e2: UIButton!
    @IBOutlet weak var e3: UIButton!
    @IBOutlet weak var e4: UIButton!
    
    let viewmodel = CategoryViewModel.shared
    
    var job: String?
    var trem: String?
    var language: String?
    var etc: String?
    var filter: Filter?

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
        self.presentingViewController?.modalTransitionStyle = .coverVertical
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func preparation(_ sender: UIButton) {
        if sender.titleLabel?.text == "취준생" {
            p1.tintColor = .primaryColor
            self.pTintColor(p2, p3, p4)
        } else if sender.titleLabel?.text == "직장인" {
            p2.tintColor = .primaryColor
            self.pTintColor(p1, p3, p4)
        } else if sender.titleLabel?.text == "학생" {
            p3.tintColor = .primaryColor
            self.pTintColor(p1, p2, p4)
        } else if sender.titleLabel?.text == "취미" {
            p4.tintColor = .primaryColor
            self.pTintColor(p1, p2, p3)
        }
        job = sender.titleLabel?.text
    }
    
    @IBAction func term(_ sender: UIButton) {
        if sender.titleLabel?.text == "단기간" {
            t1.tintColor = .primaryColor
            self.tTintColor(t2, t3)
        } else if sender.titleLabel?.text == "장기간" {
            t2.tintColor = .primaryColor
            self.tTintColor(t1, t3)
        } else if sender.titleLabel?.text == "상관없음" {
            t3.tintColor = .primaryColor
            self.tTintColor(t2, t1)
        }
        trem = sender.titleLabel?.text
    }
    
    @IBAction func language(_ sender: UIButton) {
        if sender.titleLabel?.text == "iOS" {
            l1.tintColor = .primaryColor
            self.lTintColor(l2, l3)
        } else if sender.titleLabel?.text == "Android" {
            l2.tintColor = .primaryColor
            self.lTintColor(l1, l3)
        } else if sender.titleLabel?.text == "Java" {
            l3.tintColor = .primaryColor
            self.lTintColor(l1, l2)
        }
        language = sender.titleLabel?.text
    }
    
    
    @IBAction func etc(_ sender: UIButton) {
        if sender.titleLabel?.text == "의자" {
            e1.tintColor = .primaryColor
            self.eTintColor(e2, e3, e4)
        } else if sender.titleLabel?.text == "책상" {
            e2.tintColor = .primaryColor
            self.eTintColor(e1, e3, e4)
        } else if sender.titleLabel?.text == "PC" {
            e3.tintColor = .primaryColor
            self.eTintColor(e1, e2, e4)
        } else if sender.titleLabel?.text == "안경" {
            e4.tintColor = .primaryColor
            self.eTintColor(e1, e2, e3)
        }
        etc = sender.titleLabel?.text
    }
    
    @IBAction func save(_ sender: UIButton) {
        viewmodel.categoryClick(job: job ?? "", lan: language ?? "", trem: trem ?? "", etc: etc ?? "")
        NotificationCenter.default.post(name: .notiName, object: viewmodel)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension PopUpViewController {
    func pTintColor(_ p1: UIButton, _ p2: UIButton, _ p3: UIButton) {
        p1.tintColor = .clear
        p2.tintColor = .clear
        p3.tintColor = .clear
    }
    
    func tTintColor(_ t1: UIButton, _ t2: UIButton) {
        t1.tintColor = .clear
        t2.tintColor = .clear
    }
    
    func lTintColor(_ l1: UIButton, _ l2: UIButton) {
        l1.tintColor = .clear
        l2.tintColor = .clear
    }
    
    func eTintColor(_ e1: UIButton, _ e2: UIButton, _ e3: UIButton) {
        e1.tintColor = .clear
        e2.tintColor = .clear
        e3.tintColor = .clear
    }
}
