//
//  PreviewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 02.12.2021.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Preview"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let horizontalView = HorizontalPreviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setContraints()
    }
    
    func setContraints(){
        horizontalView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        contentView.addSubview(horizontalView.view)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            horizontalView.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            horizontalView.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalView.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalView.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
