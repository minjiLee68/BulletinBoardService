//
//  NoticeBoardViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/11.
//

import UIKit

class NoticeBoardViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        UIViewStyle.viewStyle(view: viewBG)
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        buttonClickPassOver()
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        buttonClickPassOver()
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        buttonClickPassOver()
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        buttonClickPassOver()
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        buttonClickPassOver()
    }
    
    func buttonClickPassOver() {
        print("clicked")
    }
}

class NoriceBoardOwnPageViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIViewStyle.viewStyle(view: viewBG)
    }
}