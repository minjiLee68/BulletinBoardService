//
//  ReplyViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/19.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class ReplyViewModel {
    static let shard = ReplyViewModel()
    
    let firestore = Firestore.firestore()
    let uid = Auth.auth().currentUser?.uid
    var documentId: String = ""
    var counts: Int = 0
    
    func addReply(id: String, nickName: String, reply: String) {
        let collectionListener = firestore.collection(id).document(self.documentId).collection("Reply")
        let document = collectionListener.document()
        let reply = Reply(id: self.documentId, nickName: nickName, reply: reply)
        do {
            try document.setData(from: reply)
            print("id \(self.documentId)")
        } catch { return }
    }
    
    func documentCount(id: String, Did: String) {
        let collectionListener = firestore.collection(id).document(Did).collection("Reply")
        collectionListener.getDocuments { (document, error) in
            if let err = error {
                print("Error getting documents: \(err)")
            } else {
                self.counts = document?.count ?? 0
            }
        }
    }
    
    func getReplyData(id: String,completion: @escaping([Reply]) -> ()) {
        firestore.collection(id).document(self.documentId).collection("Reply").getDocuments { (document, error) in
            guard let data = document else { return }
            var replys: [Reply] = []
            data.documentChanges.forEach { change in
                do {
                    let reply = try change.document.data(as: Reply.self)
                    replys.append(reply)
                } catch let error {
                    print("ERROR JSON Pasing \(error)")
                }
            }
            DispatchQueue.main.async {
                completion(replys)
            }
        }
    }
}
