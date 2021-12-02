//
//  HorizontalReviewController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 02.12.2021.
//

import UIKit



class HorizontalReviewController: HorizontalSnappingView {

    private let horizontalId = "horizontalReviewId"
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(HorizontalReviewCell.self, forCellWithReuseIdentifier: horizontalId)
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: horizontalId, for: indexPath) as! HorizontalReviewCell
        return cell
    }
}

extension HorizontalReviewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - SizeConstants.rightLeftSize*2.5, height: view.frame.height)
    }
}
