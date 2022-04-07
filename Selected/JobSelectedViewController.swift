//
//  JobSelectedViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/05.
//

import UIKit

class JobSelectedViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewmodel = FavoriteViewModel.shared
    var page: String = ""
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        UIViewStyle.collectionViewStyle(collectionView: collectionView)
        
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(pageTitleObserver(_:)), name: .notiName, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func pageTitleObserver(_ notification: Notification) {
        if let noti = notification.object as? CategoryViewModel {
            noti.getFilterData { filter in
                self.page = filter.job
            }
        }
        self.collectionView.reloadData()
    }
}

extension JobSelectedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if page == "취준생" {
            return viewmodel.preparationCount
        } else if page == "직장인" {
            return viewmodel.officworkersCount
        } else if page == "학생" {
            return viewmodel.studentsCount
        } else {
            return viewmodel.hobbyCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobSelectedCell", for: indexPath) as? JobSelectedCell else { return UICollectionViewCell() }
        
        switch page {
        case "취준생":
            let title = viewmodel.preparationList[indexPath.item]
            cell.updateUI(title: title)
            cell.pageControlStyle(listCount: viewmodel.preparationCount)
            return cell
        case "직장인":
            let title = viewmodel.officworkersList[indexPath.item]
            cell.updateUI(title: title)
            cell.pageControlStyle(listCount: viewmodel.officworkersCount)
            return cell
        case "학생":
            let title = viewmodel.studentsList[indexPath.item]
            cell.updateUI(title: title)
            cell.pageControlStyle(listCount: viewmodel.studentsCount)
            return cell
        default:
            let title = viewmodel.hobbyList[indexPath.item]
            cell.updateUI(title: title)
            cell.pageControlStyle(listCount: viewmodel.hobbyCount)
            return cell
        }
    }
}

extension JobSelectedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension JobSelectedViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        let index: Int
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
        
     }
    
}

class JobSelectedCell: UICollectionViewCell {
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    func updateUI(title: String) {
        titleText.text = title
        titleText.lineBreakMode = .byCharWrapping
    }
    
    func pageControlStyle(listCount: Int) {
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = listCount
        pageControl.pageIndicatorTintColor = .darkGray
    }
}

extension JobSelectedCell: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        self.pageControl.currentPage = page
        print("page -> \(pageControl.currentPage)")
    }
}
