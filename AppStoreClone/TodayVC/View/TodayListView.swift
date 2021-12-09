//
//  TodayListView.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 09.12.2021.
//

import UIKit

class TodayListView: UIView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIV = UIActivityIndicatorView(style: .large)
        activityIV.startAnimating()
        activityIV.hidesWhenStopped = true
        activityIV.color = .darkGray
        activityIV.translatesAutoresizingMaskIntoConstraints = false
        return activityIV
    }()
    
    func setConstraints(_ view: UIView){
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
