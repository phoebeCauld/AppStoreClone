//
//  HorizontalPreviewController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 02.12.2021.
//

import UIKit



class HorizontalPreviewController: HorizontalSnappingView {
    
    private let horizontalCell = "horizontalCell"
    var previewDetail: Results?{
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.register(HorizontalPreviewCell.self, forCellWithReuseIdentifier: horizontalCell)

    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return previewDetail?.screenshotUrls.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: horizontalCell, for: indexPath) as! HorizontalPreviewCell
        let screenshot = previewDetail?.screenshotUrls[indexPath.item]
        cell.previewImage.sd_setImage(with: URL(string: screenshot ?? ""))
        return cell
    }
}


extension HorizontalPreviewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: view.frame.height)
    }
}
