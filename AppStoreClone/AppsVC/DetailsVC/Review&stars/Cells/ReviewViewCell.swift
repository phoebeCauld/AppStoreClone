//
//  ReviewViewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 02.12.2021.
//

import UIKit

class ReviewViewCell: UICollectionViewCell {
    
    private let reveiwTitle: UILabel = {
        let label = UILabel()
        label.text = "Reviews&Raiting"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let horizontalView = HorizontalReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setContraints()
    }
    
    func setContraints(){
        horizontalView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(reveiwTitle)
        contentView.addSubview(horizontalView.view)
        
        NSLayoutConstraint.activate([
            reveiwTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            reveiwTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: 16),
            reveiwTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            horizontalView.view.topAnchor.constraint(equalTo: reveiwTitle.bottomAnchor, constant: 16),
            horizontalView.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalView.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalView.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
