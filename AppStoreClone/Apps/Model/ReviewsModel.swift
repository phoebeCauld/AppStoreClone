//
//  ReviewsModel.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 03.12.2021.
//

import Foundation

struct ReviewsModel: Decodable{
    let feed: ReviewsFeed
}

struct ReviewsFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
}

struct Author: Decodable{
    let name: Label
}

struct Label: Decodable{
    let label: String
}
