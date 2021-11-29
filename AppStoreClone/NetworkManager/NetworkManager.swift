//
//  NetworkManager.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 28.11.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchSearchResults(searchText: String, completion: @escaping ([Results], Error?) -> ()){
        let urlStr = "https://itunes.apple.com/search?term=\(searchText)&entity=software"
        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, error in
            if let error = error {
                print("Fetching failed with:", error.localizedDescription)
                completion([], nil)
                return
            }
            if let data = data {
                do {
                    let searchResultData = try JSONDecoder().decode(SearchResultsModel.self, from: data)
                    completion(searchResultData.results, nil)
                } catch let error {
                    print("Decoding failed with:", error)
                    completion([], error)
                }
            }
        }.resume()
    }
    
    func fetchGames(completion: @escaping (AppsFetch?, Error?) -> ()) {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Fetching data failed with: \(error.localizedDescription)")
                completion(nil, error)
                return
            }        
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(AppsFetch.self, from: data)
                    completion(decodedData, nil)
                } catch let error {
                    print("Decoding failed with: \(error)")
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
