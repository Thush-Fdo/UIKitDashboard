//
//  StickyHeaderVC.swift
//  UIKitDashboard
//
//  Created by Shermin Fernando on 20/07/2024.
//

import UIKit


class StickyHeaderVC: UICollectionViewController {
    
    private var cellID = "CellID"
    private var headerID = "HeaderID"
    var headerView: UIKDStickyHeader?
    var animator: UIViewPropertyAnimator!
    
    var padding: CGFloat = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
//        setupBlurAnimator()
    }
    
    func configureViewController() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Sticky Header"
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let contentOffsetY = scrollView.contentOffset.y
        
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        
//        print(contentOffsetY)
//        
//        if contentOffsetY > 0 {
//            animator.startAnimation()
//            animator.fractionComplete = 0
//        } else {
//            animator.startAnimation()
//            animator.fractionComplete = abs(contentOffsetY) / 100
//        }
        
//        animator.stopAnimation(true)
//        animator.finishAnimation(at: .start)
    }
    
//    func setupBlurAnimator() {
//        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
//            self!.headerView?.setupBlurEffect()
//        })
//    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(UIKDStickyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as? UIKDStickyHeader
        
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width, height: 340)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        cell.backgroundColor = .black
        
        return cell
    }
    
}

extension StickyHeaderVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
}
