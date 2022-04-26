//
//  ReplyViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit

class ReplyViewController: UIViewController {
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var reply: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    let boardVM = BoardViewModel.shard
    let userVM = UserInfoViewModel.shared
    let replyVM = ReplyViewModel.shard
    
    var documentId: String = ""
    var titleText: String = ""
    var replys: [Reply] = []
    var index: Int = 0
    var counts: Int = 0
    
    override func viewWillLayoutSubviews() {
        tableview.rowHeight = 80
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.sizeToFit()
        contents.sizeToFit()
        userData()
        communityBoard()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.replys.removeAll()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        let name = nickName.text ?? ""
        let reply = reply.text ?? ""
        replyVM.addReply(id: titleText, nickName: name, reply: reply, tableview: tableview)
        self.reply.text = ""
    }
    
    func userData() {
        userVM.getData { user in
            self.nickName.text = user.nickName
        }
    }
    
    func communityBoard() {
        boardVM.getdocuments(id: titleText) { board in
            self.titleLabel.text = board[self.index].title
            self.contents.text = board[self.index].contents
        }
        replyVM.getReplyData(collectionName: titleText, Did: documentId) { [weak self] reply in
            self?.replys.append(reply)
            self?.counts = self?.replys.count ?? 0
        }
    }
}

extension ReplyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.counts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reply", for: indexPath) as? ReplyCell else { return UITableViewCell() }
        let nickName = self.replys[indexPath.row].nickName
        let replys = self.replys[indexPath.row].reply
        debugPrint(self.replys)
        cell.update(nickName: nickName, contents: replys)
//        replyVM.getReplyData(id: titleText) { [weak self] reply in
//            self?.replys.append(reply)
//            let nickName = self?.replys[indexPath.row].nickName
//            let replys = self?.replys[indexPath.row].reply
//            debugPrint(self?.replys)
//            cell.update(nickName: nickName ?? "", contents: replys ?? "")
//        }
        return cell
    }
}

class ReplyCell: UITableViewCell {
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        contents.sizeToFit()
    }
    
    func update(nickName: String, contents: String) {
        self.nickName.text = nickName
        self.contents.text = contents
    }
}

