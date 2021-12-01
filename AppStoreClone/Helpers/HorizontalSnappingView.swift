//
//  HorizontalSnappingView.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 01.12.2021.
//

import UIKit

class HorizontalSnappingView: UICollectionViewController{
    
     init() {
        let layout = SnapLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
         collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnapLayout: UICollectionViewFlowLayout{
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        let itemWidth = collectionView.frame.width - SizeConstants.rightLeftSize*1.8
        var currentItemIdx = round(collectionView.contentOffset.x / itemWidth)
        
        let vX = velocity.x
            if vX > 0 {
              currentItemIdx += 1
            } else if vX < 0 {
              currentItemIdx -= 1
            }

            let nearestPageOffset = currentItemIdx * itemWidth
            return CGPoint(x: nearestPageOffset,
                           y: parent.y)
    }
}
