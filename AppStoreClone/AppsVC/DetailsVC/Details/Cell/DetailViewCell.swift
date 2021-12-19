//
//  DetailViewCell.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 01.12.2021.
//

import UIKit

class DetailViewCell: UICollectionViewCell {

    var details: Results? {
        didSet {
            iconImage.sd_setImage(with: URL(string: details?.artworkUrl100 ?? ""))
            nameLabel.text = details?.trackName
            notesLabel.text = details?.releaseNotes
            priceButton.setTitle(details?.formattedPrice, for: .normal)
        }
    }

    let iconImage: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 12
        icon.clipsToBounds = true
        icon.widthAnchor.constraint(equalToConstant: 140).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return icon
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App name"
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 2
        return label
    }()

    let notesLabel: UILabel = {
        let label = UILabel()
        label.text = "text about new cool things in app"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    let whatsNewLabel: UILabel = {
        let label = UILabel()
        label.text = "What's new"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()

    let priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Free", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }

    func setConstraints() {
        let nameAndIconStack = UIStackView(arrangedSubviews: [
        iconImage,
        VerticalStackView(arrangedSubviews: [nameLabel,
                                             UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()
                                            ], spacing: 16)])
        nameAndIconStack.spacing = 16
        let stack = VerticalStackView(arrangedSubviews: [
        nameAndIconStack, whatsNewLabel, notesLabel
        ], spacing: 12)
        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            priceButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
