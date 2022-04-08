//
//  JobSelectedViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/05.
//

import UIKit

class JobSelectedViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let favoriteVM = FavoriteViewModel.shared
    let categoryVM = CategoryViewModel.shared
    var page: String = ""
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        UIViewStyle.collectionViewStyle(collectionView: collectionView)
        
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initPageTitle()
        NotificationCenter.default.addObserver(self, selector: #selector(pageTitleObserver(_:)), name: .notiName, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func pageTitleObserver(_ notification: Notification) {
        if let noti = notification.object as? CategoryViewModel {
            noti.getFilterData { filter in
                self.page = filter.job
                self.collectionView.reloadData()
            }
        }
    }
    
    func initPageTitle() {
        categoryVM.getFilterData { filter in
            self.page = filter.job
            self.collectionView.reloadData()
        }
    }
}

extension JobSelectedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if page == "취준생" {
            return favoriteVM.preparationCount
        } else if page == "직장인" {
            return favoriteVM.officworkersCount
        } else if page == "학생" {
            return favoriteVM.studentsCount
        } else {
            return favoriteVM.hobbyCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobSelectedCell", for: indexPath) as? JobSelectedCell else { return UICollectionViewCell() }
        
        switch page {
        case "취준생":
            let title = favoriteVM.preparationList[indexPath.item]
            let image = UIImage(named: favoriteVM.preparetionImage[indexPath.item]) ?? UIImage()
            cell.updateUI(title: title, image: image)
            cell.pageControlStyle(listCount: favoriteVM.preparationCount)
            return cell
        case "직장인":
            let title = favoriteVM.officworkersList[indexPath.item]
            let image = UIImage(named: favoriteVM.preparetionImage[indexPath.item]) ?? UIImage()
            cell.updateUI(title: title, image: image)
            cell.pageControlStyle(listCount: favoriteVM.officworkersCount)
            return cell
        case "학생":
            let title = favoriteVM.studentsList[indexPath.item]
            let image = UIImage(named: favoriteVM.preparetionImage[indexPath.item]) ?? UIImage()
            cell.updateUI(title: title, image: image)
            cell.pageControlStyle(listCount: favoriteVM.studentsCount)
            return cell
        default:
            let title = favoriteVM.hobbyList[indexPath.item]
            let image = UIImage(named: favoriteVM.preparetionImage[indexPath.item]) ?? UIImage()
            cell.updateUI(title: title, image: image)
            cell.pageControlStyle(listCount: favoriteVM.hobbyCount)
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
        CollectionViewCenterCGRect.collectionViewCenter(collectionView: collectionView, scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset)
     }
}

class JobSelectedCell: UICollectionViewCell {
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    func updateUI(title: String, image: UIImage) {
        pageImage.image = image
        titleText.text = title
        titleText.lineBreakMode = .byCharWrapping
    }
    
    func pageControlStyle(listCount: Int) {
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = listCount
        pageControl.pageIndicatorTintColor = .darkGray
        print("--> \(pageControl.currentPage)")
    }
}

extension JobSelectedCell: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let page = Int(targetContentOffset.pointee.x / self.frame.width)
//        self.pageControl.currentPage = page
//        print(page)
        let width = scrollView.bounds.size.width // 너비 저장
        let x = scrollView.contentOffset.x + (width / 2.0) // 현재 스크롤한 x좌표 저장
        
        let newPage = Int(x / width)
        if self.pageControl.currentPage != newPage {
            self.pageControl.currentPage = newPage
        }
    }
}
