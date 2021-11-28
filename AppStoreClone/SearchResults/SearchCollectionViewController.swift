//
//  SearchCollectionViewController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 28.11.2021.
//

import UIKit
import SDWebImage

private let searchCellId = "searchCell"

class SearchCollectionViewController: UICollectionViewController {

    private var searchResults:[Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: searchCellId)
        fetchSearchResults()
    }
    
    
    func fetchSearchResults(){
        NetworkManager.shared.fetchSearchResults { results, error in
            if let error = error {
                print("Failed fetching with:", error)
            }
            self.searchResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCellId, for: indexPath) as! SearchCollectionViewCell
        cell.searchView.searchResult = searchResults[indexPath.item]
        return cell
    }
    
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}
