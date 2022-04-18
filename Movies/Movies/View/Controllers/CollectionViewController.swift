//
//  CollectionViewController.swift
//  Movies
//
//  Created by Vishal Sharma on 17/04/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellIdentifier: CellIdentifier = .trending
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UICollectionView Extention for its delegates, DataSource and UICollectionViewDelegateFlowLayout Implementation
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieCollectionViewCell, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        let movie = movies[indexPath.row]
        cell.iconView.image = UIImage(named: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = 0.0
        let inset = 10.0
        switch cellIdentifier {
        case .trending:
            width = collectionView.bounds.size.width / 4 - inset
        case .recommendedShows:
            width = collectionView.bounds.size.width / 2 - inset
        case .popularShows:
            width = collectionView.bounds.size.width / 3 - inset
        }
        return CGSize(width: width, height: Constants.collectionViewCellHeight)
    }
}
