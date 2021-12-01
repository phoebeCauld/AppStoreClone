//
//  SearchResultsModel.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 28.11.2021.
//

import Foundation

struct SearchResultsModel: Decodable {
    let resultCount: Int
    let results: [Results]
}

struct Results: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: String // app icon
    let screenshotUrls: [String]
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}


