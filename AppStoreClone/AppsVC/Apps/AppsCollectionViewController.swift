//
//  AppsCollectionViewController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 29.11.2021.
//

import UIKit

class AppsCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "CellId"
    private let headerId = "HeaderId"
    private let appView = AppsView()
    private var appsArray = [AppsFetch]()
    private var headerGroup = [AppsNewsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        appView.setConstraints(view)
        collectionView.register(AppsCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
        fetchData()
    }

    private func fetchData() {
        let dispatchGroup = DispatchGroup()
        var group1: AppsFetch?
        var group2: AppsFetch?

        dispatchGroup.enter()
        NetworkManager.shared.fetchTopFreeApps { appsFetch, error in
            dispatchGroup.leave()
            if let error = error {
                print("fetching games failed with: \(error.localizedDescription)")
                return
            }
           group1 = appsFetch
        }

        dispatchGroup.enter()
        NetworkManager.shared.fetchTopPaidApps { appsFetch, error in
            dispatchGroup.leave()
            if let error = error {
                print("fetching games failed with: \(error.localizedDescription)")
                return
            }
            group2 = appsFetch
        }

        dispatchGroup.enter()
        NetworkManager.shared.fetchAppsNewData { apps, error in
            dispatchGroup.leave()
            if let error = error {
                print("fetching games failed with: \(error.localizedDescription)")
                return
            }
            if let apps = apps {
                self.headerGroup = apps
            }
        }

        dispatchGroup.notify(queue: .main) {
            self.appView.activityIndicator.stopAnimating()
            if let group1 = group1 {
                self.appsArray.append(group1)
            }
            if let group2 = group2 {
                self.appsArray.append(group2)
            }
            self.collectionView.reloadData()
        }
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: headerId,
                                                                     for: indexPath) as! HeaderView
        header.horizontalController.headerGroup = headerGroup
        header.horizontalController.collectionView.reloadData()
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsArray.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! AppsCollectionViewCell
        let apps = appsArray[indexPath.item]
        cell.titleLabel.text = apps.feed.title
        cell.horizontalController.fetchedApps = apps
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectItem = { app in
            let detailVC = DetailAppsController(appId: app.id)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        return cell
    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
