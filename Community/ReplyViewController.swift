//
//  ReplyViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit

class ReplyViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contents: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.sizeToFit()
        contents.sizeToFit()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ReplyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reply", for: indexPath) as? ReplyCell else { return UITableViewCell() }
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
}

