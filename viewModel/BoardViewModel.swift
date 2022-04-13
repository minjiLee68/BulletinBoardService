//
//  ReplyViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class BoardViewModel {
    static let shard = BoardViewModel()
    let firestore = Firestore.firestore()
    
    func createboard(title: String, contents: String, time: String) {
        let board = Board(title: title, contents: contents, time: time)
        do {
           try  firestore.collection("Board").document(title).setData(from: board)
        }catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func getdocuments() {
        firestore.collection("Board").getDocuments { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                for documents in querySnapshot.documents {
                    let id = documents.documentID
                    print("--> \(id)")
                }
            }
        }
    }
}
