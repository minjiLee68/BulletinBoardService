//
//  CategoryViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/09.
//

import UIKit

class CommunityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(screenChange), name: .datapass, object: nil)
    }
    
    @objc func screenChange() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "board") as? boardViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
