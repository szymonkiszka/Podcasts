//
//  PodcastsSearchController.swift
//  Podcasts
//
//  Created by Simon on 29.04.2018.
//  Copyright © 2018 Simon. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    var podcasts = [
        Podcast(trackName: "Podcast name", artistName: "Szymon Kiszka"),
        Podcast(trackName: "JRE", artistName: "Joe Rogan"),
        Podcast(trackName: "ABC News", artistName: "Jocko Willink")
    ]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    // MARK:- Setup Work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(1)
        Service.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
            self.podcasts = podcasts
            self.tableView.reloadData()
        }
    }

    
    // MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.trackName ?? "")\n\(podcast.artistName ?? "")"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        
        return cell
    }
    
    
}
