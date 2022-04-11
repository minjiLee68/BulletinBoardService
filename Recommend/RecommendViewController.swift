//
//  RecommendViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/24.
//

import UIKit

class RecommendViewController: UIViewController {
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var job: UIButton!
    @IBOutlet weak var lan: UIButton!
    @IBOutlet weak var trem: UIButton!
    @IBOutlet weak var etc: UIButton!
    
    let usersVM = UserInfoViewModel.shared
    let catogoryVM = CategoryViewModel.shared
    let favoriteVM = FavoriteViewModel.shared

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setFilterData()
        NotificationCenter.default.addObserver(self, selector: #selector(rotate(_:)), name: .notiName, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func rotate(_ notification: Notification) {
        if let noti = notification.object as? CategoryViewModel {
            noti.getFilterData { filter in
                self.job.titleLabel?.text = filter.job
                self.lan.titleLabel?.text = filter.langauge
                self.trem.titleLabel?.text = filter.trem
                self.etc.titleLabel?.text = filter.etc
            }
        }
    }
    
    func setFilterData() {
        catogoryVM.getFilterData { filter in
            self.job.titleLabel?.text = filter.job
            self.lan.titleLabel?.text = filter.langauge
            self.trem.titleLabel?.text = filter.trem
            self.etc.titleLabel?.text = filter.etc
        }
        usersVM.getData { info in
            self.nickName.text = info.nickName + "님에게 추천합니다!"
        }
    }
    
    @IBAction func popupView(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "popup") as! PopUpViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: false, completion: nil)
    }
}
