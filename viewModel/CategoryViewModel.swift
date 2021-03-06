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

    func categoryClick(job: String, lan: String, term: String, etc: String) {
        let data = Filter.init(job: job, langauge: lan, trem: term, etc: etc)
        do {
            try fireStore.collection("Filter").document(uid!).setData(from: data)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func getFilterData(completionHandler: @escaping(Filter) -> ()) {
        fireStore.collection("Filter").document(uid!).getDocument { snapshot, error in
            guard let documents = snapshot?.data() else {
                print("ERROR Firestore Fetching document \(String(describing: error))")
                return
            }
            let data = documents
            do {
                let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
                let filterDB = try JSONDecoder().decode(Filter.self, from: jsonDB)
                DispatchQueue.main.async {
                    completionHandler(filterDB)
                }
            } catch let error {
                print("ERROR JSON Pasing \(error)")
            }
        }
    }
}
