//
//  ProfileSettingViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/15.
//

import UIKit
import PhotosUI

class ProfileSettingViewController: UIViewController {
    @IBOutlet weak var language: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var currentJob: UITextField!
    
    var imgURL: URL? = nil
    var selectCity = ""
    let porpuseData = ["코린이", "직장인", "취준생"]
    let languageData = ["Swift", "Kotlin", "Java"]
    
    let pickerView = UIPickerView()
    var configration = PHPickerConfiguration()
    let viewModel = ProfileViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        currentJob.inputView = pickerView
        language.inputView = pickerView
        pickerView.layer.backgroundColor = UIColor.white.cgColor
    }
    
    @IBAction func imageBtn(_ sender: UIButton) {
        openLibray()
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        saveUserInfo()
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        language.resignFirstResponder()
        currentJob.resignFirstResponder()
    }
    
    func saveUserInfo() {
        viewModel.fireStorage(
            image: profileImage.image!,
            name: nickName.text ?? "",
            job: currentJob.text ?? "",
            language: language.text ?? ""
        )
        guard let sb = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        sb.modalPresentationStyle = .fullScreen
        self.present(sb, animated: false, completion: nil)
    }
}

extension ProfileSettingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ProfileSettingViewController: PHPickerViewControllerDelegate {
    func openLibray() {
        configration.selectionLimit = 0
        configration.filter = .images
        let picker = PHPickerViewController(configuration: configration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider,itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.sync {
                    self.profileImage.image = image as? UIImage
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ProfileSettingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentJob.text?.isEmpty == true {
            return porpuseData[row]
        } else {
            return languageData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentJob.text?.isEmpty == true {
            return porpuseData.count
        } else {
            return languageData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentJob.text?.isEmpty == true {
            currentJob.text = porpuseData[row]
        } else {
            language.text = languageData[row]
        }
    }
}
