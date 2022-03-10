//
//  dietCategoryViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit

class dietCategoryViewController: UIViewController {
    let viewmodel = dietViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension dietCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dietCell", for: indexPath) as? dietCell else { return UICollectionViewCell() }
        
        let image = UIImage(named: viewmodel.items[indexPath.item]) ?? UIImage()
        cell.updateUI(image: image)
        return cell
    }
}

class dietCell: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    
    func updateUI(image: UIImage) {
        categoryImage.image = image
    }
}

class dietViewModel {
    static let shared = dietViewModel()
    var items: [String] = ["diet1", "diet2", "diet3", "diet4"]
    
    var numOfItems: Int{
        return items.count
    }
}
