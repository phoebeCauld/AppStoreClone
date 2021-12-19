//
//  FullViewDescriptionCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 07.12.2021.
//

import UIKit

class FullViewDescriptionCell: UITableViewCell {

    let descriptionLabel: UILabel = {
        let label = UILabel()

        let attributedText = NSMutableAttributedString(string: "Great games",
                                                       attributes: [.foregroundColor: UIColor.black])

        attributedText.append(NSAttributedString(string: " are all about the details, from subtle visual effects to imaginative art styles. In these titles, you're sure to find something to marvel at, whether you're into fantasy worlds or neon-soaked dartboards.",
                                                 attributes: [.foregroundColor: UIColor.gray]))

        attributedText.append(NSAttributedString(string: "\n\n\nHeroic adventure",
                                                 attributes: [.foregroundColor: UIColor.black]))

        attributedText.append(NSAttributedString(string: "\nBattle in dungeons. Collect treasure. Solve puzzles. Sail to new lands. Oceanhorn lets you do it all in a beautifully detailed world.",
                                                 attributes: [.foregroundColor: UIColor.gray]))

        attributedText.append(NSAttributedString(string: "\n\n\nHeroic adventure",
                                                 attributes: [.foregroundColor: UIColor.black]))

        attributedText.append(NSAttributedString(string: "\nBattle in dungeons. Collect treasure. Solve puzzles. Sail to new lands. Oceanhorn lets you do it all in a beautifully detailed world.",
                                                 attributes: [.foregroundColor: UIColor.gray]))

        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.attributedText = attributedText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }

    func setConstraints() {
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
