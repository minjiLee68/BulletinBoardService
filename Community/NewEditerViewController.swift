//
//  NewEditerViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit

class NewEditerViewController: UIViewController {
    @IBOutlet weak var boardTitle: UILabel!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var contents: UITextView!
    
    var titleText: String?
    let viewmodel = BoardViewModel.shard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        boardTitle.text = titleText
        boardTitle.textAlignment = .center
    }
    
    @IBAction func save(_ sender: UIButton) {
        setContents()
        self.dismiss(animated: false, completion: nil)
    }
    
    func setContents() {
        guard let title = titleLabel.text else { return }
        guard let contents = contents.text else { return }
        viewmodel.createboard(title: title, contents: contents, time: "04/12")
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
