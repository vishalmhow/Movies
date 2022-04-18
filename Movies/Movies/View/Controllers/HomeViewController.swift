//
//  HomeViewController.swift
//  Movies
//
//  Created by Vishal22 Sharma on 18/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: [CellIdentifier] = [.trending, .popularShows, .recommendedShows]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableView Extention for its delegates and DataSource Implementation
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellIdentifier.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = self.cellIdentifier[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier.rawValue, for: indexPath)
        guard let collectionController = self.storyboard?.instantiateViewController(withIdentifier: Constants.collectionViewController) as? CollectionViewController else {
            return cell
        }
        collectionController.view.frame = CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: cellIdentifier.cellHeight)
        collectionController.cellIdentifier = cellIdentifier
        self.addChild(collectionController)
        collectionController.didMove(toParent: self)
        cell.addSubview(collectionController.view)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellIdentifier[indexPath.section].cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cellIdentifier[section].header
    }
}

