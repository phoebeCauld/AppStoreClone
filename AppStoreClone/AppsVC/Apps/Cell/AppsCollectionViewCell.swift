//
//  AppsCollectionViewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 29.11.2021.
//

import UIKit

class AppsCollectionViewCell: UICollectionViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Apps Section"
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let horizontalController = HorizontalCollectionViewController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalController.view)
        setConstraints()
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: ConstraintConstants.left),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            horizontalController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct ConstraintConstants {
    static let left: CGFloat = 16
}
