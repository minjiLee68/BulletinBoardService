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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vcStyle()
        titleText.text = titleLabel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(tableRelod), name: .reload, object: nil)
    }
    
    @objc func tableRelod() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func editButtonClick(_ sender: UIButton) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "newedit") as? NewEditerViewController else { return }
        dvc.modalPresentationStyle = .fullScreen
        dvc.titleText = titleLabel
        self.present(dvc, animated: false)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
        viewmodel.getdocuments(id: titleLabel) { boards in
            let title = boards?[indexPath.row].title ?? ""
            let contents = boards?[indexPath.row].contents ?? ""
            cell.update(title: title, contents: contents)
        }
        return cell
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
