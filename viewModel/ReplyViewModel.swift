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
    var documentId: String = ""
    var counts: Int = 0
    
    func addReply(nickName: String, reply: String) {
        let document = firestore.collection("board").document(self.documentId).collection("Reply").document()
        let reply = Reply(id: self.documentId, nickName: nickName, reply: reply, time: "04/12")
        do {
            try document.setData(from: reply)
        } catch { return }
    }
    
    func documentCount(id: String) {
        firestore.collection("Reply").whereField("id", isEqualTo: self.documentId).getDocuments { (document, error) in
            guard let data = document else { return }
            self.counts = data.count
        }
    }
    
    func getReplyData(completion: @escaping([Reply], Int) -> ()) {
        let document = firestore.collection("board").document(self.documentId).collection("Reply")
        document.whereField("id", isEqualTo: self.documentId).getDocuments { (document, error) in
            guard let doc = document else { return }
            var reply: [Reply] = []
            doc.documentChanges.forEach { change in
                do {
                    let data = change.document.data()
                    let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
                    let userDB = try JSONDecoder().decode(Reply.self, from: jsonDB)
                    reply.append(userDB)
                } catch let error {
                    print("ERROR JSON Pasing \(error)")
                }
            }
            DispatchQueue.main.async {
                completion(reply, reply.count)
                print(reply)
                print(self.documentId)
            }
        }
    }
}
