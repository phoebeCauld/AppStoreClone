//
//  DetailAppsController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 01.12.2021.
//

import UIKit

class DetailAppsController: HorizontalSnappingView {
    private let cellId = "detailCell"
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            NetworkManager.shared.fetchGenericsData(urlString: urlString, completion: { (res: SearchResultsModel?, error) in
                print(res?.results.first?.releaseNotes)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailViewCell
        return cell
    }
}

extension DetailAppsController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
}
