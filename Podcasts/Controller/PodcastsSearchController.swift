//
//  PodcastsSearchController.swift
//  Podcasts
//
//  Created by Simon on 29.04.2018.
//  Copyright © 2018 Simon. All rights reserved.
//

import UIKit

class PodcastsSearchController: UITableViewController {
    
    let podcasts = [
        Podcast(name: "Simon Podcast", artistName: "Szymon Kiszka"),
        Podcast(name: "JRE", artistName: "Joe Rogan"),
        Podcast(name: "Jocko Podcast", artistName: "Jocko Willink"),
        Podcast(name: "Simon Podcast", artistName: "Szymon Kiszka"),
        Podcast(name: "JRE", artistName: "Joe Rogan"),
        Podcast(name: "Jocko Podcast", artistName: "Jocko Willink"),
        Podcast(name: "Simon Podcast", artistName: "Szymon Kiszka"),
        Podcast(name: "JRE", artistName: "Joe Rogan"),
        Podcast(name: "Jocko Podcast", artistName: "Jocko Willink")
    ]
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        
        return cell
    }
    
    
}
