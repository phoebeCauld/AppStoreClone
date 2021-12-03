//
//  HorizontalReviewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 02.12.2021.
//

import UIKit

class HorizontalReviewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "REVIEW NAME"
        label.font = .boldSystemFont(ofSize: 20)
        label.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Random author"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    let starsLabel: UILabel = {
        let label = UILabel()
        label.text = "Stars"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text\nSome Text\nSome Text\nSome Text"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 12
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        setConstraints()
    }
    
    func setConstraints(){
        let topStack = UIStackView(arrangedSubviews: [titleLabel, authorLabel])
        topStack.spacing = 20
        
        let stack = VerticalStackView(arrangedSubviews: [
            topStack,
            starsLabel,
            bodyLabel
        ], spacing: 12)
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
