//
//  dietCategoryViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit

class dietCategoryViewController: UIViewController {
    @IBOutlet weak var viewBG: UIView!
    
    let viewmodel = dietViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIViewStyle.viewStyle(view: viewBG)
    }
}

extension dietCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dietCell", for: indexPath) as? dietCell else { return UICollectionViewCell() }
        
        let image = UIImage(named: viewmodel.items[indexPath.item]) ?? UIImage()
        let text = viewmodel.itemText[indexPath.item]
        cell.updateUI(image: image, text: text)
        return cell
    }
}

extension dietCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 180)
    }
}

class dietCell: UICollectionViewCell {
    @IBOutlet weak var imageViewBG: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func updateUI(image: UIImage, text: String) {
        categoryImage.image = image
        categoryLabel.text = text
        
        categoryImage.layer.cornerRadius = 10
        imageViewBG.layer.cornerRadius = 10
        imageViewBG.layer.masksToBounds = true
    }
}
