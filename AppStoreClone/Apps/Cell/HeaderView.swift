//
//  HeaderView.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 29.11.2021.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
     let horizontalController = HeaderCollectionViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        horizontalController.view.backgroundColor = .blue
        addSubview(horizontalController.view)
        setConstraints()
    }
    
    func setConstraints(){
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalController.view.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
