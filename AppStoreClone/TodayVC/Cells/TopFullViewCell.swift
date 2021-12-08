//
//  TopFullViewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 07.12.2021.
//

import UIKit

class TopFullViewCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    func setConstraints(){
        todayCell.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(todayCell)
        contentView.addSubview(closeButton)
        NSLayoutConstraint.activate([
            todayCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            todayCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            todayCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            todayCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
