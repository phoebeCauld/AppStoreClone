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

    private var searchResults: [Results] = []
    private let searchController = UISearchController(searchResultsController: nil)
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: searchCellId)
        fetchSearchResults()
        setupSearchController()
    }

    private func setupSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.delegate = self
    }

    func fetchSearchResults() {
        NetworkManager.shared.fetchSearchResults(searchText: "instagram") { results, error in
            if let error = error {
                print("Failed fetching with:", error)
            }
            self.searchResults = results?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCellId,
                                                      for: indexPath) as! SearchCollectionViewCell
        cell.searchView.searchResult = searchResults[indexPath.item]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailAppsController(appId: String(searchResults[indexPath.item].trackId))
        navigationController?.pushViewController(detailVC, animated: true)
    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}

extension SearchCollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            NetworkManager.shared.fetchSearchResults(searchText: searchText) { results, error in
                if let error = error {
                    print("Failed fetching with:", error)
                }
                self.searchResults = results?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
}
