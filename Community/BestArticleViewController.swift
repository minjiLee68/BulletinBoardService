//
//  BestArticleViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/03/10.
//

import UIKit

class BestArticleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewBG: UIView!
    
    let boardVM = BoardViewModel.shard
    let replyVM = ReplyViewModel.shard
    var counts: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 100
        viewBG.layer.cornerRadius = 12
        UIViewStyle.viewStyle(view: viewBG)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bestCommunity()
    }
    
    func bestCommunity() {
        boardVM.getdocuments("자유게시판") { [weak self] board, count in
            self?.counts = count
            OperationQueue.main.addOperation {
                self?.tableView.reloadData()
            }
        }
    }
}

extension BestArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.counts)
        return self.counts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bestArticleCell", for: indexPath) as? bestArticleCell else { return UITableViewCell() }
         
        boardVM.getdocuments("자유게시판") { [weak self] board, _ in
            if board.isEmpty {
                self?.counts = 0
                cell.update(title: "", contents: "")
            } else {
                let title = board[indexPath.item].title
                let contents = board[indexPath.item].contents
                cell.update(title: title, contents: contents)
            }
        }
    
        return cell
    }
}

class bestArticleCell: UITableViewCell {
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func update(title: String, contents: String) {
        self.title.text = title
        self.contents.text = contents
    }
}
