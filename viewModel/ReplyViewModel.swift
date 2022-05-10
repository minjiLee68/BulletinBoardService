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
import DropDown

class ReplyViewModel {
    static let shard = ReplyViewModel()
    let firestore = Firestore.firestore()
    
    var collectionName: String = ""
    var documentId: String = ""
    var counts: Int = 0
    
    func addReply(nickName: String, reply: String) {
        let document = firestore.collection(self.collectionName).document(self.documentId).collection("Reply").document()
        let reply = Reply(id: self.documentId, nickName: nickName, reply: reply, time: "04/12")
        do {
            try document.setData(from: reply)
        } catch { return }
    }
    
    func getReplyData(completion: @escaping([Reply], Int) -> ()) {
        let document = firestore.collection(self.collectionName).document(self.documentId).collection("Reply")
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
    
    func addLike() {
        let doc = firestore.collection(self.collectionName).document(self.documentId)
        firestore.runTransaction({ (transaction, error) -> Any? in
            let document: DocumentSnapshot
            do {
                try document = transaction.getDocument(doc)
            } catch let err as NSError {
                error?.pointee = err
                return nil
            }
            guard let like = document.data()?["like"] as? Int else {
                let err = NSError(domain: "AppErrorDomain", code: -1, userInfo: [
                    NSLocalizedDescriptionKey: "Unable to retrieve like from snashop \(document)"
                ])
                error?.pointee = err
                return nil
            }
            transaction.updateData(["like": like + 1], forDocument: doc)
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error)")
            } else {
                print("Transaction successfully committed!!")
            }
        }
    }
    
    func likeCount(completion: @escaping (Int) -> ()) {
        let doc = firestore.collection(self.collectionName).document(self.documentId)
        doc.getDocument { document, error in
            let data = document?.data()
            if let result = data?["like"] as? Int {
                completion(result)
            }
        }
    }
}
