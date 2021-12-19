//
//  FloatingControlsView.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 18.12.2021.
//

import UIKit

class FloatingControlsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let appImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    let appName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    let appInfo: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .darkGray
        button.tintColor = .white
        return button
    }()

    let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .regular))

    func setupView() {
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
       let stack = UIStackView(arrangedSubviews: [appImage,
                                                 VerticalStackView(arrangedSubviews: [appName, appInfo]),
                                                  getButton])
        stack.alignment = .center
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        blurEffect.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(blurEffect)
        self.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            appImage.heightAnchor.constraint(equalToConstant: 68),
            appImage.widthAnchor.constraint(equalTo: appImage.heightAnchor),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 30),

            blurEffect.topAnchor.constraint(equalTo: self.topAnchor),
            blurEffect.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blurEffect.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blurEffect.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
