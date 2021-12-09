//
//  TodayItem.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 08.12.2021.
//

import UIKit

struct TodayItem {
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroungColor: UIColor
    let cellStyle: CellStyle
    let appsResult: [FeedResults]
    enum CellStyle: String {
        case multiply, single
    }
}
