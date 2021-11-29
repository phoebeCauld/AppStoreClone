//
//  AppsCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 29.11.2021.
//

import UIKit

class AppsCell: UICollectionViewCell {
    
    let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 12
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Label"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple.inc"
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(white: 0.5, alpha: 1)
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()        
    }
    
    private func setConstraints(){
        let stack = UIStackView(arrangedSubviews: [iconImage, VerticalStackView(arrangedSubviews: [nameLabel,companyLabel], spacing: 5),getButton])
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
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
