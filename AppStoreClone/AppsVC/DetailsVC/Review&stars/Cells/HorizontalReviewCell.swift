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
    
    let starsStack: UIStackView = {
        var subviews = [UIView]()
        (0..<5).forEach { _ in
            let stars = UIImageView()
            stars.image = UIImage(systemName: "star.fill")
            stars.tintColor = .systemYellow
            stars.widthAnchor.constraint(equalToConstant: 24).isActive = true
            stars.heightAnchor.constraint(equalToConstant: 24).isActive = true
            subviews.append(stars)
        }
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.addArrangedSubview(UIView())
        return stack
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text\nSome Text\nSome Text\nSome Text"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 5
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
            starsStack,
            bodyLabel
        ], spacing: 8)
           addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
