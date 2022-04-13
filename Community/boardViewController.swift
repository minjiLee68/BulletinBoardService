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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        vcStyle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func vcStyle() {
        tableView.rowHeight = 100
        editButton.layer.borderWidth = 1
        editButton.layer.cornerRadius = 10
        editButton.layer.borderColor = UIColor.primaryColor?.cgColor
    }
    
    @IBAction func editButtonClick(_ sender: UIButton) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "newedit") as? NewEditerViewController else { return }
        dvc.modalPresentationStyle = .fullScreen
        dvc.titleText = self.titleText.text
        self.present(dvc, animated: false)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension boardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "boardCell", for: indexPath) as? boardCell else { return UITableViewCell() }
        return cell
    }
    
}

class boardCell: UITableViewCell {
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
}
