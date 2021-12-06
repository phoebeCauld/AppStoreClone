//
//  HorizontalPrewieCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 02.12.2021.
//

import UIKit

class HorizontalPreviewCell: UICollectionViewCell {
    
    let previewImage: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.lightGray.cgColor
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setContraints()
    }
    
    func setContraints(){
        contentView.addSubview(previewImage)
        
        NSLayoutConstraint.activate([
            previewImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            previewImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            previewImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            previewImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
