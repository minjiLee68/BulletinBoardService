//
//  JobSelectedViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/05.
//

import UIKit

class JobSelectedViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewmodel = FavoriteViewModel.shared
    var page: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pageTitleObserver(_:)), name: .favoriteNoti, object: nil)
    }
    
    @objc func pageTitleObserver(_ notification: Notification) {
        if let noti = notification.object as? String {
            page = noti
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension JobSelectedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if page == "취준생" {
            return viewmodel.preparationCount
        } else if page == "직장인" {
            return viewmodel.officworkersCount
        } else if page == "학생" {
            return viewmodel.studentsCount
        } else {
            return viewmodel.hobbyCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobSelectedCell", for: indexPath) as? JobSelectedCell else { return UICollectionViewCell() }
       return cell
    }
}

class JobSelectedCell: UICollectionViewCell {
    @IBOutlet weak var titleText: UILabel!
    
    func updateUI(title: String) {
        titleText.text = title
        titleText.lineBreakMode = .byCharWrapping
    }
}
