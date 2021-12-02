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
    
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            NetworkManager.shared.fetchGenericsData(urlString: urlString, completion: { (res: SearchResultsModel?, error) in
                let app = res?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
        }
    }
    
    private var app: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellId)
        collectionView.register(ReviewViewCell.self, forCellWithReuseIdentifier: reviewCellId)

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailViewCell
            cell.details = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! PreviewCell
            cell.horizontalView.previewDetail = app
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewViewCell
        return cell
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension DetailAppsController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 500
        
        if indexPath.item == 0 {
            let currentCell = DetailViewCell.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1000))
            currentCell.details = app
            currentCell.layoutIfNeeded()
            
            let size = currentCell.systemLayoutSizeFitting(CGSize(width: view.frame.width, height: 1000))
            
            return CGSize(width: view.frame.width, height: size.height)
        } else  if indexPath.item == 1{
            height = 500
        } else {
            height = 250
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
}
