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
        let reply = Reply(id: self.documentId, nickName: nickName, reply: reply, time: "04/12")
        do {
            try document.setData(from: reply)
        } catch { return }
    }
    
    func getReplyData(collectionName: String, Did: String, completion: @escaping(Reply) -> ()) {
        firestore.collection(collectionName).document(Did).collection("Reply").getDocuments { (document, error) in
            guard let doc = document else { return }
            doc.documentChanges.forEach { change in
                do {
                    let data = change.document.data()
                    let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
                    let userDB = try JSONDecoder().decode(Reply.self, from: jsonDB)
                    DispatchQueue.main.async {
                        self.counts = document?.count ?? 0
                        completion(userDB)
                    }
                } catch let error {
                    print("ERROR JSON Pasing \(error)")
                }
            }
        }
    }
}
