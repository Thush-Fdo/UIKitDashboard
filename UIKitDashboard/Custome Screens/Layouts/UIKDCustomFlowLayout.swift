//
//  CustomLayout.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 28/06/2024.
//

import UIKit

class UIKDCustomFlowLayout: UICollectionViewFlowLayout {

    var previousOffset: CGFloat = 0.0
    var currentPage = 0
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let itemCount = collectionView.numberOfItems(inSection: 0)
        if previousOffset > collectionView.contentOffset.x && velocity.x < 0.0 {
            currentPage = max(currentPage - 1, 0)
        } else if previousOffset < collectionView.contentOffset.x && velocity.x > 0.0 {
            currentPage = min(currentPage + 1, itemCount - 1)
        }
        
        let offset = updateOffset(collectionView)
        previousOffset = offset
        
        return CGPoint(x: offset, y: proposedContentOffset.y)
    }
    
    func updateOffset(_ collectionView: UICollectionView) -> CGFloat {
        let colViewWidth = collectionView.frame.width
        let itemW = itemSize.width
        let minLineSpace = minimumLineSpacing
        
        let edge = (colViewWidth - itemW - (minLineSpace * 2)) / 2
        return (itemW + minLineSpace) * CGFloat(currentPage) - (edge + minLineSpace)
    }
}
