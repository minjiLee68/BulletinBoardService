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
    
    var users: UserInfo?
    
    func ifProfile(completionHandler: @escaping(Bool) -> ()) {
        fireStore.collection("UserInfo").document(uid!).getDocument { snapshot, error in
            guard let documents = snapshot?.data() else {
                print("data없어")
                return completionHandler(true)
            }
            let data = documents
            let name = data["nickName"] as? String ?? ""
            if name.isEmpty == false {
                print("data있어")
                completionHandler(false)
            }
        }
    }
    
    func fireStorage(image: UIImage, name: String, job: String, language: String) {
        let metaData = StorageMetadata()
        let storageRef = storage.reference().child("\(uid!).jpg")
        
        guard let images = image.jpegData(compressionQuality: 0.4) else { return }
        storageRef.putData(images, metadata: metaData) { (metadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            } else {
                storageRef.downloadURL { (url, error) in
                    self.fireStoreSetDB(url: url!, name: name, job: job, language: language)
                }
            }
        }
    }
    
    func fireStoreSetDB(url: URL, name: String, job: String, language: String) {
        let users = UserInfo(nickName: name, language: language, job: job, profile: url)
        do {
            try fireStore.collection("UserInfo").document(uid!).setData(from: users)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    //mapping
//    func getData(completionHandler: @escaping(UserInfo) -> ()) {
//        fireStore.collection("UserInfo").document(uid!).getDocument { snapshot, error in
//            guard let documents = snapshot?.data() else {
//                print("ERROR Firestore Fetching document \(String(describing: error))")
//                return
//            }
//            let data = documents
//            do {
//                let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
//                let userDB = try JSONDecoder().decode(UserInfo.self, from: jsonDB)
//                DispatchQueue.main.async {
//                    completionHandler(userDB)
//                }
//            } catch let error {
//                print("ERROR JSON Pasing \(error)")
//            }
//        }
//    }
}
