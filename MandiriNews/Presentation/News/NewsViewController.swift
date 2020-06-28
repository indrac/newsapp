//
//  ViewController.swift
//  MandiriNews
//
//  Created by Indra Cahyadi on 24/06/20.
//  Copyright © 2020 Indra Cahyadi. All rights reserved.
//

import UIKit
import Kingfisher

class NewsViewController: UITableViewController, UINavigationControllerDelegate {
    
    let controlRefresh = UIRefreshControl()
    private var searchedNews: [Articles]?
    private var searching = false
    var news: [Articles]?
    private(set) var viewModel: NewsViewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.fetchNews { (res) in
            DispatchQueue.main.async {
                switch res {
                case .failure(let err):
                    print(err)
                case .success(let articles):
                    self.news = articles.articles
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! NewsCell
        
        var newsArray: [Articles]?
        if searching { newsArray = searchedNews } else { newsArray = news }
        cell.titleLabel.text = newsArray?[indexPath.row].title
        cell.descriptionLabel.text = newsArray?[indexPath.row].description
        cell.coverImageView.kf.indicatorType = .activity
        cell.coverImageView.kf.setImage(with: URL(string: newsArray?[indexPath.row].urlToImage ?? ""), options: [.backgroundDecode,.cacheOriginalImage])
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching { return searchedNews?.count ?? 0 } else {
            return news?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newsArray: [Articles]?
        if searching { newsArray = searchedNews } else { newsArray = news }
        let detailVC = WebController()
        detailVC.urlString.value = newsArray?[indexPath.row].url ?? ""
        self.navigationController?.present(detailVC, animated: true, completion: nil)
    }
}


extension NewsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            searchedNews = self.news?.filter {
                $0.title?.lowercased().range(of: searchText.lowercased()) != nil
            }
            searching = true
        } else { searching = false }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
