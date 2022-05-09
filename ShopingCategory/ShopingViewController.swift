//
//  ShopingViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/05/09.
//

import UIKit
import Alamofire
import Kingfisher

class ShopingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let filterVM = CategoryViewModel.shared
    var items: [Field] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filterVM.getFilterData { filter in
            self.shopingCategory(item: filter.etc)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(itemCategory(_:)), name: .notiName, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.reloadData()
    }
    
    @objc func itemCategory(_ notification: Notification) {
        if let noti = notification.object as? CategoryViewModel {
            noti.getFilterData { filter in
                self.shopingCategory(item: filter.etc)
            }
        }
    }
    
    func shopingCategory(item: String) {
        ShopingCategory.category(item) { items in
            self.items = items
            self.collectionView.reloadData()
        }
    }
}

extension ShopingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopingCell", for: indexPath) as? ShopingCell else { return UICollectionViewCell() }
        
        let item = items[indexPath.item]
        let url = URL(string: item.image)!
        cell.update(title: item.title, image: url)
        return cell
    }
}

extension ShopingViewController: UICollectionViewDelegate {
    
}

class ShopingCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLebel: UILabel!
    
    func update(title: String, image: URL) {
        self.titleLebel.text = title
        self.imageView.kf.setImage(with: image)
    }
}

class ShopingCategory {
    static func category(_ items: String, completion: @escaping ([Field]) -> ()) {

        let clientID = "V2kFdPDbE1jCHcRNs7Bi"
        let clientKEY = "EMDufaZVi7"
        
        let query = "https://openapi.naver.com/v1/search/shop.json"
        let encodingQuery = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        let param = ["query" : items]
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-Naver-Client-Id" : clientID,
            "X-Naver-Client-Secret" : clientKEY
        ]
        
        AF.request(encodingQuery, method: .get, parameters: param, headers: headers)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(Shoping.self, from: data)
                        let items = result.items
                        completion(items)
                    } catch {
                        completion([])
                    }
                case .failure(_):
                    completion([])
                }
            }
//
//        let encodingQuery = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
//        let queryURL = URL(string: encodingQuery)!
//
//        var requestURL = URLRequest(url: queryURL)
//        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
//        requestURL.addValue(clientKEY, forHTTPHeaderField: "X-Naver-Client-Secret")
//
//        let dataTask = session.dataTask(with: requestURL) { data, response, error in
//            let successRange = 200..<300
//
//            guard error == nil, let statuCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statuCode) else { return completion([]) }
//        }
    }
}
