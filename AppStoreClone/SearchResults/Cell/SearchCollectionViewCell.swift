//
//  SearchCollectionViewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 28.11.2021.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    let searchView = SearchCellView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        searchView.addSubview(contentView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
