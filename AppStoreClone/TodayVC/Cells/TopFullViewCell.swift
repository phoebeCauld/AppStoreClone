//
//  TopFullViewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 07.12.2021.
//

import UIKit

class TopFullViewCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    func setConstraints(){
        todayCell.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(todayCell)
        NSLayoutConstraint.activate([
            todayCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            todayCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            todayCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            todayCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    

    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
