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
    private var documentListener: ListenerRegistration?
    let reply: Reply? = nil
    var counts: Int = 0
    
    func addReply(id: String, documentId: String, nickName: String, reply: String) {
        let collectionPath = "\(id)/\(documentId)/Reply"
        let collectionListener = firestore.collection(collectionPath)
        let reply = Reply(id: documentId, nickName: nickName, reply: reply)
        guard let dictionary = reply.asDictionary else {
                print("decode error")
                return
            }
            collectionListener.addDocument(data: dictionary)
//        do {
//            try firestore.collection(collectionPath).document().setData(from: reply)
//        } catch let error {
//            print("error \(error)")
//        }
    }
    
    func documentCount(id: String, documentId: String) {
        let collectionPath = "\(id)/\(documentId)/Reply"
        firestore.collection(collectionPath).getDocuments { (document, error) in
            guard let data = document else { return }
            self.counts = data.count
        }
    }
    
    func subscribe(id: String, documentId: String, completion: @escaping ([Reply]) -> ()) {
        let collectionPath = "\(id)/\(documentId)/Reply"
        removeListener()
        let collectionListener = firestore.collection(collectionPath)
        
        documentListener = collectionListener.addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else {
                print("error")
                return
            }
            var reply = [Reply]()
            snapshot.documentChanges.forEach { change in
                switch change.type {
                case .added, .modified:
                    do {
                        let replys = try change.document.data(as: Reply.self)
                        reply.append(replys)
                    } catch {
                        print("error")
                    }
                default: break
                }
            }
            completion(reply)
        }
    }
    
    func removeListener() {
            documentListener?.remove()
        }

//    func getReplyData(id: String, documentId: String, tableview: UITableView, completion: @escaping([Reply]) -> ()) {
//        firestore.collection(id).document(documentId).collection("Reply").getDocuments { (document, error) in
//            guard let data = document else { return }
//            var replys: [Reply] = []
//            data.documentChanges.forEach { change in
//                do {
//                    let data = change.document.data()
//                    let jsonDB = try JSONSerialization.data(withJSONObject: data, options: [])
//                    let userDB = try JSONDecoder().decode(Reply.self, from: jsonDB)
//                    replys.append(userDB)
//                } catch let error {
//                    print("ERROR JSON Pasing \(error)")
//                }
//            }
//            DispatchQueue.main.async {
//                completion(replys)
//                tableview.reloadData()
//            }
//        }
//    }
}
