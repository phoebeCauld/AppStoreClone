//
//  NetworkManager.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 28.11.2021.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    func fetchSearchResults(searchText: String, completion: @escaping (SearchResultsModel?, Error?) -> Void) {
        let urlStr = "https://itunes.apple.com/search?term=\(searchText)&entity=software"
        fetchGenericsData(urlString: urlStr, completion: completion)
    }

    func fetchAppsNewData(completion: @escaping ([AppsNewsModel]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericsData(urlString: urlString, completion: completion)
    }

    func fetchTopFreeApps(completion: @escaping (AppsFetch?, Error?) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json"
        fetchApps(with: urlString, completion: completion)
    }

    func fetchTopPaidApps(completion: @escaping (AppsFetch?, Error?) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/25/apps.json"
        fetchApps(with: urlString, completion: completion)
    }

    func fetchApps(with url: String, completion: @escaping (AppsFetch?, Error?) -> Void) {
        fetchGenericsData(urlString: url, completion: completion)
    }

    func fetchGenericsData<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Fetching data failed with: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData, nil)
                } catch let error {
                    print("Decoding failed with: \(error)")
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
