//
//  ProfileViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/16.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProfileViewModel {
    static let shared = ProfileViewModel()
    let storage = Storage.storage()
    let fireStore = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid
    
    var users: UserInfo? = nil
    
    func fireStorage(image: UIImage, name: String, kg: String, cm: String, porpuse: String) {
        let metaData = StorageMetadata()
        let storageRef = storage.reference().child("\(uid!).jpg")
        
        guard let images = image.jpegData(compressionQuality: 0.4) else { return }
        storageRef.putData(images, metadata: metaData) { (metadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            } else {
                storageRef.downloadURL { (url, error) in
                    self.fireStoreSetDB(url: url!, name: name, kg: kg, cm: cm, porpuse: porpuse)
                }
            }
        }
    }
    
    func fireStoreSetDB(url: URL, name: String, kg: String, cm: String, porpuse: String) {
        users = UserInfo(nickName: name, kg: kg, cm: cm, porpuse: porpuse, profile: url)
        do {
            try fireStore.collection("UserInfo").document(uid!).setData(from: users)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func getData() {
        fireStore.collection("UserInfo").getDocuments { (querySnapshot, error) in
            if let err = error {
                print("There was an issue retrieving data from Firestore \(err)")
            } else {
                self.snapshotDoc(querySnapshot: querySnapshot)
            }
        }
    }
    
    func snapshotDoc(querySnapshot: QuerySnapshot?) {
        if let snapshotDocuments = querySnapshot?.documents {
            for doc in snapshotDocuments {
                print(doc.data())
            }
        }
    }
}
