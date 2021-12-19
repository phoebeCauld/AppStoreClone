//
//  HorizontalReviewController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 02.12.2021.
//

import UIKit

class HorizontalReviewController: HorizontalSnappingView {

    private let horizontalId = "horizontalReviewId"
    var reviews: ReviewsFeed? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(HorizontalReviewCell.self, forCellWithReuseIdentifier: horizontalId)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.entry.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: horizontalId,
                                                      for: indexPath) as! HorizontalReviewCell
        let entry = reviews?.entry[indexPath.item]
        cell.titleLabel.text = entry?.title.label
        cell.authorLabel.text = entry?.author.name.label
        cell.bodyLabel.text = entry?.content.label
        for (index, view) in cell.starsStack.arrangedSubviews.enumerated() {
            if let raiting = Int(entry!.rating.label) {
                view.alpha = index >= raiting ? 0 : 1
            }
        }
        return cell
    }
}

extension HorizontalReviewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - SizeConstants.rightLeftSize*2.5, height: view.frame.height)
    }
}
