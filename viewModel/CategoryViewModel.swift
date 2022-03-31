//
//  CategoryViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/28.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class CategoryViewModel {
    static let shared = CategoryViewModel()
    let fireStore = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid
    var filter: Filter?

    func categoryClick(job: String, lan: String, trem: String, etc: String) {
        let data = Filter.init(job: job, lan: lan, trem: trem, etc: etc)
        do {
            try fireStore.collection("Filter").document(uid!).setData(from: data)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
}
