//
//  Constants.swift
//  Movies
//
//  Created by Vishal22 Sharma on 18/04/22.
//

import UIKit

enum CellIdentifier: String {
    case trending = "TrendingCell"
    case popularShows = "PopularShows"
    case recommendedShows = "RecommendedShows"
    
    var cellHeight: CGFloat {
        switch self {
        case.trending: return 100
        case .popularShows: return 200
        case .recommendedShows: return 250
        }
    }
    
    var header: String {
        switch self {
        case.trending: return "Latest & Trending"
        case .popularShows: return "Popular shows"
        case .recommendedShows: return "Recommended for you"
        }
    }
}

struct Constants {
    static let movieCollectionViewCell = "MovieCollectionViewCell"
    static let collectionViewController = "CollectionViewController"
    static let headerHeight: CGFloat = 50
    static let collectionViewCellHeight: CGFloat = 250
}
