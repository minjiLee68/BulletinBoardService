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
        
        NotificationCenter.default.addObserver(self, selector: #selector(screenChange(_:)), name: .datapass, object: nil)
    }
    
    @objc func screenChange(_ notification: Notification) {
        if let noti = notification.object as? String {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "board") as? boardViewController else { return }
            vc.modalPresentationStyle = .fullScreen
            vc.titleLabel = noti
            self.present(vc, animated: false, completion: nil)
        }
    }
}
