//
//  DetailAppsController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 01.12.2021.
//

import UIKit

class DetailAppsController: UICollectionViewController {

    private let cellId = "detailCell"
    private let previewCellId = "previewCellId"
    private let reviewCellId = "reviewCellId"

    fileprivate let appId: String
    private var app: Results?
    private var reviews: ReviewsFeed?

    init(appId: String) {
        self.appId = appId
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellId)
        collectionView.register(ReviewViewCell.self, forCellWithReuseIdentifier: reviewCellId)
        fetchData()
    }

    func fetchData() {
        let urlString = "https://itunes.apple.com/lookup?id=\(appId)"
        NetworkManager.shared.fetchGenericsData(urlString: urlString, completion: { (res: SearchResultsModel?, error) in
            if let error = error {
                print("Failed fetching app data:\(error)")
            }
            let app = res?.results.first
            self.app = app
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })

        let url = "https://itunes.apple.com/us/rss/customerreviews/id=\(appId)/mostrecent/json"
        NetworkManager.shared.fetchGenericsData(urlString: url) { (reviews: ReviewsModel?, error) in
            if let error = error {
                print("Failed fetching reviews data:\(error)")
            }
            let review = reviews?.feed
            self.reviews = review
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                          for: indexPath) as! DetailViewCell
            cell.details = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId,
                                                        for: indexPath) as! PreviewCell
            cell.horizontalView.previewDetail = app
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId,
                                                      for: indexPath) as! ReviewViewCell
        cell.horizontalView.reviews = reviews
        return cell
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension DetailAppsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 500

        if indexPath.item == 0 {
            let currentCell = DetailViewCell.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1000))
            currentCell.details = app
            currentCell.layoutIfNeeded()

            let size = currentCell.systemLayoutSizeFitting(CGSize(width: view.frame.width, height: 1000))

            return CGSize(width: view.frame.width, height: size.height)
        } else  if indexPath.item == 1 {
            height = 500
        } else {
            height = 280
        }
        return CGSize(width: view.frame.width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}
