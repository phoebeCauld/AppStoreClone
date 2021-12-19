//
//  SearchCellView.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 28.11.2021.
//

import UIKit

class SearchCellView: UIView {

    var searchResult: Results! {
        didSet {
            nameLabel.text = searchResult.trackName
            categoryLabel.text = searchResult.primaryGenreName
            if let url = URL(string: searchResult.artworkUrl100) {
                iconView.sd_setImage(with: url)
            }
            firstImageView.sd_setImage(with: URL(string: searchResult.screenshotUrls[0]))
            if searchResult.screenshotUrls.count > 1 {
                secondImageView.sd_setImage(with: URL(string: searchResult.screenshotUrls[1]))
            }
            if searchResult.screenshotUrls.count > 2 {
                thirdImageView.sd_setImage(with: URL(string: searchResult.screenshotUrls[2]))
            }
        }
    }

    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Apps name"
        return label
    }()

    let categoryLabel: UILabel = {
       let label = UILabel()
        label.text = "Photos&Videos"
        return label
    }()

    let raitingLabel: UILabel = {
       let label = UILabel()
        label.text = "9.6m"
        return label
    }()

    let iconView: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 12
        icon.clipsToBounds = true
        icon.widthAnchor.constraint(equalToConstant: 64).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return icon
    }()

    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return button
    }()

    lazy var firstImageView = createInfoImageView()
    lazy var secondImageView = createInfoImageView()
    lazy var thirdImageView = createInfoImageView()

    lazy var infoTopStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconView,
                                                   VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, raitingLabel]),
                                                   getButton])
        stack.spacing = 12
        stack.alignment = .center
        return stack
    }()

    lazy var infoImageStack: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [firstImageView,
                                                      secondImageView,
                                                      thirdImageView])
        stackView.spacing = SearchCellConstants.spacing
        stackView.distribution = .fillEqually
        return stackView
    }()

    lazy var finalStackView = VerticalStackView(arrangedSubviews: [infoTopStackView,
                                                                   infoImageStack],
                                                spacing: SearchCellConstants.spacing)

    override func addSubview(_ view: UIView) {
        view.addSubview(finalStackView)
        setConstraints(view)
    }

    private func createInfoImageView() -> UIImageView {
        let screenShootView = UIImageView()
        screenShootView.layer.cornerRadius = 8
        screenShootView.layer.borderWidth = 0.5
        screenShootView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        screenShootView.clipsToBounds = true
        return screenShootView
    }

    private func setConstraints(_ view: UIView) {
        NSLayoutConstraint.activate([
            finalStackView.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: SearchCellConstants.top),
            finalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: SearchCellConstants.trailing),
            finalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: SearchCellConstants.leading),
            finalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                              constant: SearchCellConstants.bottom)
        ])
    }
}

private struct SearchCellConstants {
    static let top: CGFloat = 16
    static let trailing: CGFloat = -16
    static let leading: CGFloat = 16
    static let bottom: CGFloat = -16
    static let spacing: CGFloat = 16
}
