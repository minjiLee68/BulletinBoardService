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
    
    let categoryVM = CategoryViewModel.shared
    let usersVM = UserInfoViewModel.shared

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setFilterData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setFilterData() {
        categoryVM.getFilterData { job,language,trem,etc in
            self.job.titleLabel?.text = job
            self.lan.titleLabel?.text = language
            self.trem.titleLabel?.text = trem
            self.etc.titleLabel?.text = etc
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
