//
//  ViewController.swift
//  Friendface
//
//  Created by Felix Lin on 1/18/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let dataSource = FriendDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
        configureSearchController()
    }
    
    fileprivate func configureDataSource() {
        dataSource.dataChanged = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
        dataSource.fetch("https://www.hackingwithswift.com/samples/friendface.json")
        tableView.dataSource = dataSource
    }
    
    fileprivate func configureSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Find a friend"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
    }
}

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        dataSource.filterText = searchController.searchBar.text
    }
}
