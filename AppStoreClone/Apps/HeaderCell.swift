//
//  HeaderCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 29.11.2021.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Facebook"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .blue
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text about new cool things in app"
        label.font = .systemFont(ofSize: 25)
        label.numberOfLines = 2
        return label
    }()
    
    let appImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.backgroundColor = .blue
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    private func setConstraints(){
        let stack = VerticalStackView(arrangedSubviews: [companyLabel, titleLabel, appImage], spacing: 5)
        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
