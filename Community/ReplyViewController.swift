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
    
    var titleText: String = ""
    var index: Int = 0
    var counts: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        communityBoard()
        customNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        replyGetData()
    }
    
    func communityBoard() {
        boardVM.getdocuments(titleText) { [weak self] board, _ in
            guard let self = self else { return }
            self.titleLabel.text = board[self.index].title
            self.contents.text = board[self.index].contents
            self.titleLabel.sizeToFit()
            self.contents.sizeToFit()
        }
        userVM.getData { [weak self] user in
            self?.nickName.text = user.nickName
        }
    }
    
    func replyGetData() {
        replyVM.getReplyData { _,count in
            self.counts = count
            OperationQueue.main.addOperation {
                self.tableview.reloadData()
            }
        }
    }
    
    func customNavigation() {
        NavigationCustom.navigationCustomUI(self.navigationController, title: titleText)
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        guard let name = nickName.text else { return }
        guard let reply = reply.text else { return }
        self.reply.text = ""
        replyVM.addReply(nickName: name, reply: reply)
        self.replyGetData()
    }
}

extension ReplyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableview.rowHeight = 80
        return self.counts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reply", for: indexPath) as? ReplyCell else { return UITableViewCell() }
        
        replyVM.getReplyData() { reply,_ in
            if reply.isEmpty {
                cell.update(nickName: "", contents: "")
            } else {
                let nickName = reply[indexPath.row].nickName
                let replys = reply[indexPath.row].reply
                cell.update(nickName: nickName, contents: replys)
                print(reply)
            }
        }
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

