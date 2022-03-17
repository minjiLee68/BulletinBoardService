//
//  ProfileSettingViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/15.
//

import UIKit
import Photos

class ProfileSettingViewController: UIViewController {
    @IBOutlet weak var porpusePicker: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var cm: UITextField!
    @IBOutlet weak var kg: UITextField!
    
    var imgURL: URL? = nil
    var selectCity = ""
    let porpuseData = ["벌크업", "린매스업", "다이어트", "비건"]
    
    let picker = UIImagePickerController()
    let viewModel = ProfileViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        porpusePicker.inputView = pickerView
    }
    
    @IBAction func imageBtn(_ sender: UIButton) {
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
            switch status {
            case .authorized:
                print("권한허용")
                DispatchQueue.main.async {
                    self.openLibray()
                }
            case .denied:
                print("권한거부")
            case .restricted, .notDetermined:
                print("선택하지 않음")
            default:
                break
            }
        }
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        viewModel.fireStorage(
            image: profileImage.image!,
            name: nickName.text ?? "",
            kg: kg.text ?? "",
            cm: cm.text ?? "",
            porpuse: porpusePicker.text ?? ""
        )
    }
}

extension ProfileSettingViewController:  UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    func openLibray() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
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
