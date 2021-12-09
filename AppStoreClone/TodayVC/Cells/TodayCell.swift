//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 06.12.2021.
//

import UIKit

class TodayCell: BaseTodayCell {

    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            descriptionLabel.text = todayItem.description
            cellImage.image = todayItem.image
            self.backgroundColor = todayItem.backgroungColor
        }
    }
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "LIFE HACK"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Utilazing your Time"
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    let cellImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "garden")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "All the tools and apps you need to intelligently organize your life in the right way."
        label.numberOfLines = 3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        setConstraints()
    }
    
    func setConstraints(){
        let containerForImage = UIView()
        containerForImage.addSubview(cellImage)
        
        let stack = VerticalStackView(arrangedSubviews: [
        categoryLabel, titleLabel, containerForImage, descriptionLabel
        ])
        stack.spacing = 8
        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),

            cellImage.centerXAnchor.constraint(equalTo: containerForImage.centerXAnchor),
            cellImage.centerYAnchor.constraint(equalTo: containerForImage.centerYAnchor),
            cellImage.widthAnchor.constraint(equalToConstant: 250),
            cellImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    

    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
