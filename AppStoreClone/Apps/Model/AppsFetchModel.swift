//
//  AppsFetchModel.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 29.11.2021.
//

import Foundation

struct AppsFetch: Decodable {
    let feed: Feed
}
struct Feed: Decodable {
    let title: String
    let results: [FeedResults]
}
struct FeedResults: Decodable {
    let artistName: String
    let name: String
    let artworkUrl100: String
}
