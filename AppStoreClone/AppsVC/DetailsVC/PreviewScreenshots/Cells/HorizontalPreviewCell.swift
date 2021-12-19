//
//  HorizontalPrewieCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 02.12.2021.
//

import UIKit

class HorizontalPreviewCell: UICollectionViewCell {

    let previewImage: UIImageView = {
        let previewImage = UIImageView()
        previewImage.layer.cornerRadius = 12
        previewImage.layer.borderWidth = 0.5
        previewImage.layer.borderColor = UIColor.lightGray.cgColor
        previewImage.clipsToBounds = true
        previewImage.contentMode = .scaleAspectFill
        previewImage.translatesAutoresizingMaskIntoConstraints = false
        return previewImage
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setContraints()
    }

    func setContraints() {
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
