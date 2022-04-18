//
//  ReplyViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class BoardViewModel {
    static let shard = BoardViewModel()
    let firestore = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid
    
    var title: String = ""
    var counts: Int = 0
    
    func createboard(id: String, title: String, contents: String, time: String) {
        let board = Board.init(id: id, title: title, contents: contents, time: time)
        do {
            try  firestore.collection(id).document().setData(from: board)
        }catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func documentCount(id: String) {
        firestore.collection(id).getDocuments { (document, error) in
            guard let data = document else { return }
            self.counts = data.count
            print("count \(self.counts)")
        }
    }
    
    func getdocuments(id: String, completion: @escaping([Board]?) -> ()) {
        firestore.collection(id).addSnapshotListener { (documentSnapshot, error) in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            var boards: [Board] = []
            document.documentChanges.forEach { change in
                do {
                    let data = change.document.data()
                    let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
                    let userDB = try JSONDecoder().decode(Board.self, from: jsonDB)
                    boards.append(userDB)
                } catch let error {
                    print("ERROR JSON Pasing \(error)")
                }
            }
            DispatchQueue.main.async {
                completion(boards)
            }
        }
    }
     
//    func jsonData(change: DocumentChange) {
//        let data = change.document.data()
//        do {
//            switch change.type {
//            case .added, .modified:
//                let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
//                let userDB = try JSONDecoder().decode(Board.self, from: jsonDB)
//                self.boards.append(userDB)
//            default: break
//            }
//        } catch let error {
//            print("ERROR JSON Pasing \(error)")
//        }
//    }
}
