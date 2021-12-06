//
//  HeaderCollectionViewController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 29.11.2021.
//

import UIKit
import SDWebImage

class HeaderCollectionViewController: HorizontalSnappingView {

    private let reuseIdentifier = "Cell3"
    var headerGroup = [AppsNewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.register(HeaderCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerGroup.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HeaderCell
        let app = headerGroup[indexPath.item]
        cell.companyLabel.text = app.name
        cell.titleLabel.text = app.tagline
        cell.appImage.sd_setImage(with: URL(string: app.imageUrl))
        return cell
    }
}


extension HeaderCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-SizeConstants.rightLeftSize*2.5, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return SizeConstants.lineSpacing
    }
}
