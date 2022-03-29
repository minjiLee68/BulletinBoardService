//
//  UserInfoViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserInfoViewModel {
    static let shared = UserInfoViewModel()
    let firestore = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid

    func getData(completionHandler: @escaping(UserInfo) -> ()) {
        firestore.collection("UserInfo").document(uid!).getDocument { snapshot, error in
            guard let documents = snapshot?.data() else {
                print("ERROR Firestore Fetching document \(String(describing: error))")
                return
            }
            let data = documents
            do {
                let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
                let userDB = try JSONDecoder().decode(UserInfo.self, from: jsonDB)
                DispatchQueue.main.async {
                    completionHandler(userDB)
                }
            } catch let error {
                print("ERROR JSON Pasing \(error)")
            }
        }
    }
    
    
}
