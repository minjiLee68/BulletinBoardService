//
//  TermViewController.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/07.
//

import UIKit

class TermViewController: UIViewController {
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var term: String = ""
    
    let categoryVM = CategoryViewModel.shared
    let termVM = TermSelectedViewModel.shared
    
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
                self.term = filter.trem
                self.termTitle(term: self.term)
                self.collectionView.reloadData()
            }
        }
    }

    func initPageTitle() {
        categoryVM.getFilterData { filter in
            self.term = filter.trem
            self.termTitle(term: self.term)
        }
    }
    
    func termTitle(term: String) {
        switch term {
        case "단기간":
            titleText.text = termVM.shortTitle
            break
        case "장기간":
            titleText.text = termVM.longTitle
            break
        default:
            titleText.text = termVM.nottingTitle
            break
        }
    }
}

extension TermViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch term {
        case "단기간":
            return termVM.shortCount
        case "장기간":
            return termVM.longCount
        default:
            return termVM.nottingCount
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TermCell", for: indexPath) as? TermCell else { return UICollectionViewCell() }
        
        switch term {
        case "단기간":
            let title = termVM.shortTitleList[indexPath.item]
            let image = UIImage(named: termVM.shortImage[indexPath.item]) ?? UIImage()
            let count = termVM.shortCount
            cell.update(title: title, image: image, count: count)
            return cell
        case "장기간":
            let title = termVM.longTitleList[indexPath.item]
            let image = UIImage(named: termVM.longImage[indexPath.item]) ?? UIImage()
            let count = termVM.longCount
            cell.update(title: title, image: image, count: count)
            return cell
        default:
            let title = termVM.nottingTitleList[indexPath.item]
            let image = UIImage(named: termVM.nottingImage[indexPath.item]) ?? UIImage()
            let count = termVM.nottingCount
            cell.update(title: title, image: image, count: count)
            return cell
        }
    }
}

extension TermViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension TermViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        CollectionViewCenterCGRect.collectionViewCenter(collectionView: collectionView, scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset)
    }
}

class TermCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    func update(title: String, image: UIImage, count: Int) {
        self.titleLabel.text = title
        self.image.image = image
        
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = count
        pageControl.pageIndicatorTintColor = .darkGray
        print("--> \(pageControl.currentPage)")
    }
}

extension TermCell: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        self.pageControl.currentPage = page
        print(page)
    }
}
