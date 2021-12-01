//
//  DetailViewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 01.12.2021.
//

import UIKit

class DetailViewCell: UICollectionViewCell {
    
    let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .blue
        iv.widthAnchor.constraint(equalToConstant: 140).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App name"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    let notesLabel: UILabel = {
        let label = UILabel()
        label.text = "text about new cool things in app"
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    let whatsNewLabel: UILabel = {
        let label = UILabel()
        label.text = "What's new"
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 1
        return label
    }()
    
    let priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Free", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    func setConstraints(){
        let nameAndIconStack = UIStackView(arrangedSubviews: [
        iconImage,
        VerticalStackView(arrangedSubviews: [nameLabel,
                                             priceButton,
        ]),
        UIView()])
        nameAndIconStack.spacing = 12
        let stack = VerticalStackView(arrangedSubviews: [
        nameAndIconStack, whatsNewLabel, notesLabel
        ], spacing: 12)
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
