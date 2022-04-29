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
    
    var title: String = ""
    var counts: Int = 0
    
    func createboard(title: String, contents: String) {
        let newDoc = firestore.collection("board").document()
        let board = Board.init(id: newDoc.documentID, title: title, contents: contents)
        do {
            try newDoc.setData(from: board)
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
    
    func getdocuments(completion: @escaping([Board]) -> ()) {
        firestore.collection("board").getDocuments { (documentSnapshot, error) in
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
}
