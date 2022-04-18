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
    
    var collectionName: String = ""
    var boards: [Board] = []
    var counts: Int?
    
    func createboard(title: String, contents: String, time: String) {
        let board = Board.init(title: title, contents: contents, time: time)
        do {
            try  firestore.collection("C-\(self.collectionName)").document().setData(from: board)
        }catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    
    func documentCount() {
        firestore.collection("C-\(self.collectionName)").getDocuments { (document, error) in
            guard let data = document else {
                print("Error fetching document: \(error!)")
                return
            }
            self.counts = data.count
        }
    }
    
    func getdocuments(tableview: UITableView, completion: @escaping([Board]?) -> ()) {
        firestore.collection("C-\(self.collectionName)").addSnapshotListener { (documentSnapshot, error) in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            document.documentChanges.forEach { change in
                self.jsonData(change: change)
            }
            DispatchQueue.main.async {
                completion(self.boards)
                tableview.reloadData()
            }
        }
    }
     
    func jsonData(change: DocumentChange) {
        let data = change.document.data()
        do {
            switch change.type {
            case .added, .modified:
                let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
                let userDB = try JSONDecoder().decode(Board.self, from: jsonDB)
                self.boards.append(userDB)
            default: break
            }
        } catch let error {
            print("ERROR JSON Pasing \(error)")
        }
    }
}
