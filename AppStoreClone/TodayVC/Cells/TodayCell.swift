//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 06.12.2021.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let cellImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "garden")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        setConstraints()
    }
    
    func setConstraints(){
        addSubview(cellImage)
        
        NSLayoutConstraint.activate([
            cellImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cellImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cellImage.widthAnchor.constraint(equalToConstant: 250),
            cellImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
