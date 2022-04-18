//
//  NoticeBoardViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/11.
//

import UIKit

class NoticeBoardViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var iosdevelopboard: UILabel!
    @IBOutlet weak var iosquestion: UILabel!
    @IBOutlet weak var androiddevelopboard: UILabel!
    @IBOutlet weak var androidquestion: UILabel!
    @IBOutlet weak var freeboard: UILabel!
    
    let viewmodel = BoardViewModel.shard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIViewStyle.viewStyle(view: viewBG)
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        let titleText = iosdevelopboard.text!
        buttonClickPassOver(titleText: titleText)
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        let titleText = iosquestion.text!
        buttonClickPassOver(titleText: titleText)
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        let titleText = androiddevelopboard.text!
        buttonClickPassOver(titleText: titleText)
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        let titleText = androidquestion.text!
        buttonClickPassOver(titleText: titleText)
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        let titleText = freeboard.text!
        buttonClickPassOver(titleText: titleText)
    }
    
    func buttonClickPassOver(titleText: String) {
        NotificationCenter.default.post(name: .datapass, object: titleText)
        viewmodel.documentCount(id: titleText)
    }
}

class NoriceBoardOwnPageViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIViewStyle.viewStyle(view: viewBG)
    }
}
