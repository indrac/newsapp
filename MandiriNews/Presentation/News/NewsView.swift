//
//  NewsView.swift
//  MandiriNews
//
//  Created by Indra Cahyadi on 26/06/20.
//  Copyright © 2020 Indra Cahyadi. All rights reserved.
//

import Foundation
import UIKit

extension NewsViewController {
    
    func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Constants.News
        
        tableView.register(NewsCell.self, forCellReuseIdentifier: "cellId")
        tableView.refreshControl = controlRefresh
        self.controlRefresh.addTarget(self, action: #selector(callFetchNews), for: .valueChanged)
        
        let searchBar:UISearchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = Constants.Search
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        tableView.tableHeaderView = searchBar
        
    }
    
    @objc func callFetchNews() {
        viewModel.fetchNews(completion: { _ in })
        self.controlRefresh.endRefreshing()
    }
}
