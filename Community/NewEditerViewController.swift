//
//  NewEditerViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/13.
//

import UIKit

class NewEditerViewController: UIViewController {
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var contents: UITextView!
    
    var titleText: String = ""
    let viewmodel = BoardViewModel.shard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationCustom()
    }
    
    func navigationCustom() {
        let saveBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = saveBtn
        NavigationCustom.navigationCustomUI(self.navigationController, title: titleText)
    }
    
    @objc func submit(_ sender: Any) {
        setContents()
        NotificationCenter.default.post(name: .reload, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    func setContents() {
        guard let title = titleLabel.text else { return }
        guard let contents = contents.text else { return }
        viewmodel.createboard(collectionName: titleText, title: title, contents: contents)
        NotificationCenter.default.post(name: .reload, object: nil)
    }
}

