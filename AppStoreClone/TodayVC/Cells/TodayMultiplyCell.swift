//
//  TodayMultiplyCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 09.12.2021.
//

import UIKit

class TodayMultiplyCell: BaseTodayCell {

    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            backgroundColor = todayItem.backgroungColor
            multiplyCellVC.apps = todayItem.appsResult
            multiplyCellVC.collectionView.reloadData()
        }
    }
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "CELL"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Utilazing your Time"
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()

    let multiplyCellVC = MultiplyController(mode: .small)

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        setConstraints()
    }

    private func setConstraints() {
        let stack = VerticalStackView(arrangedSubviews: [
            categoryLabel, titleLabel, multiplyCellVC.view
        ], spacing: 10)
        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
