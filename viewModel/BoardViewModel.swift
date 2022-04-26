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
    
    func createboard(id: String, title: String, contents: String) {
        let board = Board.init(id: "", title: title, contents: contents)
        do {
            try firestore.collection(id).document(uid!).setData(from: board)
        }catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func documentCount(id: String) {
        firestore.collection(id).getDocuments { (document, error) in
            guard let data = document else { return }
            self.counts = data.count
        }
    }
    
    func getdocuments(id: String, completion: @escaping([Board]) -> ()) {
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
                    var userDB = try JSONDecoder().decode(Board.self, from: jsonDB)
                    userDB.id = change.document.documentID
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
}
