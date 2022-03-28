//
//  RecommendViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/24.
//

import UIKit

class RecommendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setCategory() {
        
    }
    
    @IBAction func popupView(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "popup") as! PopUpViewController
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false, completion: nil)
    }
}
