//
//  HorizontalSnappingView.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 01.12.2021.
//

import UIKit

class HorizontalSnappingView: UICollectionViewController {

     init() {
        let layout = SnapLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
         collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
         collectionView.decelerationRate = .fast
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnapLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
         guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }

        let nextX: CGFloat
        if proposedContentOffset.x <= 0 ||
            collectionView.contentOffset == proposedContentOffset {
            nextX = proposedContentOffset.x
        } else {
            nextX = collectionView.contentOffset.x + (velocity.x > 0 ? collectionView.bounds.size.width : -collectionView.bounds.size.width)
        }

         var offsetAdjustment = CGFloat.greatestFiniteMagnitude
         let horizontalOffset = proposedContentOffset.x + collectionView.contentInset.left

         let targetRect = CGRect(x: nextX, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)

         let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)

         layoutAttributesArray?.forEach({ (layoutAttributes) in
             let itemOffset = layoutAttributes.frame.origin.x
             if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
                 offsetAdjustment = itemOffset - horizontalOffset
             }
         })

         return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
     }
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        guard let collectionView = self.collectionView else {
//            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
//        }
//        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
//        let itemWidth = collectionView.frame.width - SizeConstants.rightLeftSize*1.8
//        var currentItemIdx = round(collectionView.contentOffset.x / itemWidth)
//
//        let vX = velocity.x
//            if vX > 0 {
//              currentItemIdx += 1
//            } else if vX < 0 {
//              currentItemIdx -= 1
//            }
//
//            let nearestPageOffset = currentItemIdx * itemWidth
//            return CGPoint(x: nearestPageOffset,
//                           y: parent.y)
//    }
}
