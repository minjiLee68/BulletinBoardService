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
        let noti = notification.object as? String
        print("--> \(String(describing: noti))")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "board") as? boardViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.titleText.text = noti
        self.present(vc, animated: true, completion: nil)
    }
}
