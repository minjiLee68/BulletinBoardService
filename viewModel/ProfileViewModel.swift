//
//  ProfileViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/16.
//

import UIKit
import Firebase

class ProfileViewModel {
    static let shared = ProfileViewModel()
    let storage = Storage.storage()
    let fireStore = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid
    
    func fireStorage(image: UIImage) {
        let metaData = StorageMetadata()
//        let imageName = UUID().uuidString + String(Date().timeIntervalSince1970)
        let storageRef = storage.reference().child("\(uid!).jpg")

        guard let images = image.jpegData(compressionQuality: 0.4) else { return }
        storageRef.putData(images, metadata: metaData) { (metadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            } else {
                storageRef.downloadURL { (url, error) in
                    
                }
            }
        }
    }
    
    func fireStoreSetDB() {
        
    }
}
