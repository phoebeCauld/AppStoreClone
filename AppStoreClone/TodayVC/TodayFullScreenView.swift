//
//  TodayFullScreenView.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 07.12.2021.
//

import UIKit

class TodayFullScreenView: UIViewController {

    var dismisFullVIew: (() -> Void)?
    var todayItem: TodayItem?
    let tableView = UITableView(frame: .zero, style: .plain)
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let floatingView = FloatingControlsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.clipsToBounds = true
        setupTableView()
        setupCloseButton()
        configTabView()
        setupFloatingView()
    }

     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let transform = scrollView.contentOffset.y > 100 ? CGAffineTransform(translationX: 0, y: -120) : .identity
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
                self.floatingView.transform = transform
            }
    }

    fileprivate func setupFloatingView() {
        floatingView.appName.text = todayItem?.category
        floatingView.appInfo.text = todayItem?.title
        floatingView.appImage.image = todayItem?.image
        view.addSubview(floatingView)
        floatingView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            floatingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            floatingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            floatingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 90),
            floatingView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }

    fileprivate func setupCloseButton() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    fileprivate func setupTableView() {
        tableView.showsVerticalScrollIndicator = false
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    fileprivate func configTabView() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = todayItem?.backgroungColor
    }

    @objc fileprivate func dismissView(_ button: UIButton) {
        button.isHidden = true
        dismisFullVIew?()
    }
}

extension TodayFullScreenView: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let headerCell = TopFullViewCell()
            headerCell.todayCell.todayItem = todayItem
            return headerCell
        }
        let cell = FullViewDescriptionCell()
        cell.backgroundColor = todayItem?.backgroungColor
        return cell
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 500
        }
         return UITableView.automaticDimension
    }
}
