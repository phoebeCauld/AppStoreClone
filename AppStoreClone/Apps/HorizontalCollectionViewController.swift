//
//  HorizontalCollectionViewController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 29.11.2021.
//

import UIKit

class HorizontalCollectionViewController: HorizontalSnappingView {

    private let reuseIdentifier = "CellId2"
    var fetchedApps: AppsFetch?
    var didSelectItem: ((FeedResults) -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(AppsCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedApps?.feed.results.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsCell
        let app = fetchedApps?.feed.results[indexPath.item]
        cell.nameLabel.text = app?.name
        cell.companyLabel.text = app?.artistName
        cell.iconImage.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = fetchedApps?.feed.results[indexPath.item]{
            didSelectItem?(item)
        }
    }
}


extension HorizontalCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.height - SizeConstants.topBottomSize*2 - SizeConstants.lineSpacing*2
        let width = view.frame.width - SizeConstants.rightLeftSize*2.5
        return CGSize(width: width, height: height/3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return SizeConstants.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10,
                            left: SizeConstants.rightLeftSize,
                            bottom: 10,
                            right: SizeConstants.rightLeftSize)
    }
}

struct SizeConstants{
    static let topBottomSize: CGFloat = 12
    static let lineSpacing: CGFloat = 10
    static let rightLeftSize: CGFloat = 15
}
