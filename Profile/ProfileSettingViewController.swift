//
//  ProfileSettingViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/15.
//

import UIKit
import PhotosUI

class ProfileSettingViewController: UIViewController {
    @IBOutlet weak var porpusePicker: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var cm: UITextField!
    @IBOutlet weak var kg: UITextField!
    
    var imgURL: URL? = nil
    var selectCity = ""
    let porpuseData = ["벌크업", "린매스업", "다이어트", "비건"]
    
    let pickerView = UIPickerView()
    var configration = PHPickerConfiguration()
    let viewModel = ProfileViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        porpusePicker.inputView = pickerView
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
}

extension ProfileSettingViewController {
//    func phPhotoLibrary() {
//        PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
//            switch status {
//            case .authorized:
//                print("권한허용")
//                DispatchQueue.main.async {
//                    self.openLibray()
//                }
//            case .denied:
//                print("권한거부")
//            case .restricted, .notDetermined:
//                print("선택하지 않음")
//            default:
//                break
//            }
//        }
//    }
    
    func saveUserInfo() {
        viewModel.fireStorage(
            image: profileImage.image!,
            name: nickName.text ?? "",
            kg: kg.text ?? "",
            cm: cm.text ?? "",
            porpuse: porpusePicker.text ?? ""
        )
        guard let sb = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        sb.modalTransitionStyle = .flipHorizontal
        sb.modalPresentationStyle = .fullScreen
        self.present(sb, animated: true, completion: nil)
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
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            profileImage.image = image
//        }
//        dismiss(animated: true, completion: nil)
//    }
}

extension ProfileSettingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return porpuseData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return porpuseData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        porpusePicker.text = porpuseData[row]
    }
}
