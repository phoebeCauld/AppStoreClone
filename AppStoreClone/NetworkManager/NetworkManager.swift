//
//  NetworkManager.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 28.11.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchSearchResults(completion: @escaping ([Results], Error?) -> ()){
        let urlStr = Urls.searchResultsUrl
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
}
