//
//  dietCategoryViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit
import DropDown

class LanguageCategoryViewController: UIViewController {
    @IBOutlet weak var dropTextField: UITextField!
    @IBOutlet weak var dropImage: UIImageView!
    @IBOutlet weak var dropBtn: UIButton!
    @IBOutlet weak var viewDrop: UIView!
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dropdown = DropDown()
    let dropItem = ["Swift", "Kotlin", "Java"]
    let lanViewmodel = LanguageViewModel.shared
    let userViewmodel = UserInfoViewModel.shared
    
    var lan: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIViewStyle.viewStyle(view: viewBG)
        setUserData()
        initDropUI()
        setDropDown()
    }
    
    func setUserData() {
        userViewmodel.getData() { info in
            let users = info
            self.lan = users.language
        }
    }
    
    func initDropUI() {
        DropDownUI.dropdownUI(dropdown: dropdown, dropField: dropTextField)
        dropTextField.text = lan
    }
    
    func setDropDown() {
        DropDownUI.setDropDown(dropdown: dropdown, dropItem: dropItem, viewDrop: viewDrop, collectionView: collectionView, dropField: dropTextField)
    }
    
    @IBAction func dropViewClicked(_ sender: Any) {
        dropdown.show()
    }
}

extension LanguageCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.dropTextField.text == "Kotlin" {
            return lanViewmodel.ktnumOfItems
        } else if self.dropTextField.text == "Swift" {
            return lanViewmodel.SWnumOfItems
        } else if self.dropTextField.text == "Java" {
            return lanViewmodel.JVnumOfItems
        } else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LanguageCell", for: indexPath) as? LanguageCell else { return UICollectionViewCell() }
        
        if self.dropTextField.text == "Kotlin" {
            let image = UIImage(named: lanViewmodel.KotlinImage[indexPath.item]) ?? UIImage()
            let text = lanViewmodel.KotlinItem[indexPath.item]
            cell.updateUI(image: image, text: text)
            return cell
        } else if self.dropTextField.text == "Swift" {
            let image = UIImage(named: lanViewmodel.swiftImage[indexPath.item]) ?? UIImage()
            let text = lanViewmodel.swiftItem[indexPath.item]
            cell.updateUI(image: image, text: text)
            return cell
        } else if self.dropTextField.text == "Java" {
            let image = UIImage(named: lanViewmodel.JavaImage[indexPath.item]) ?? UIImage()
            let text = lanViewmodel.JavaItem[indexPath.item]
            cell.updateUI(image: image, text: text)
            return cell
        } else {
            print("..?")
            return UICollectionViewCell()
        }
    }
}

extension LanguageCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 180)
    }
}

class LanguageCell: UICollectionViewCell {
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