//
//  boardViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/11.
//

import UIKit

class boardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var titleText: UILabel!
    
    let viewmodel = BoardViewModel.shard
    var titleLabel: String = ""
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vcStyle()
//        titleText.text = titleLabel
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(tableRelod), name: .reload, object: nil)
        navigationRightButton()
    }
    
    @objc func tableRelod() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
    func navigationRightButton() {
        let editBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = editBtn
    }
    
    @objc func submit(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "newedit") as? NewEditerViewController else { return }
        dvc.modalPresentationStyle = .fullScreen
        dvc.titleText = titleLabel
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
//    @IBAction func editButtonClick(_ sender: UIButton) {
//        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "newedit") as? NewEditerViewController else { return }
//        dvc.modalPresentationStyle = .fullScreen
//        dvc.titleText = titleLabel
//        self.present(dvc, animated: false)
//    }
    
//    @IBAction func backButton(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    func vcStyle() {
        tableView.rowHeight = 100
        editButton.layer.borderWidth = 1
        editButton.layer.cornerRadius = 10
        editButton.layer.borderColor = UIColor.primaryColor?.cgColor
    }
}

extension boardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.counts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "boardCell", for: indexPath) as? boardCell else { return UITableViewCell() }
        viewmodel.getdocuments() { boards in
            let title = boards[indexPath.row].title
            let contents = boards[indexPath.row].contents
            cell.update(title: title, contents: contents)
        }
        return cell
    }
}

extension boardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "reply") as? ReplyViewController else { return }
        vc.modalPresentationStyle = .fullScreen
//        vc.index = indexPath.row
//        vc.titleText = titleLabel
//        viewmodel.getdocuments(id: titleLabel) { board in
//            let id = board[indexPath.row].id
//            vc.replyVM.documentCount(id: self.titleLabel, Did: id)
//            vc.replyVM.documentId = id
//        }
//        DispatchQueue.main.async {
//            vc.tableview.reloadData()
//        }
        vc.index = indexPath.row
        vc.titleText = titleLabel
        viewmodel.getdocuments() { board in
            let id = board[indexPath.row].id
            vc.replyVM.documentId = id
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class boardCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        titleLabel.sizeToFit()
        contents.sizeToFit()
    }
    
    func update(title: String, contents: String) {
        self.titleLabel.text = title
        self.contents.text = contents
        print("title \(title)")
    }
}
