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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.rowHeight = 100
        viewBG.layer.cornerRadius = 12
        UIViewStyle.viewStyle(view: viewBG)
    }
}

extension BestArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bestArticleCell", for: indexPath) as? bestArticleCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

class bestArticleCell: UITableViewCell {
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
}
