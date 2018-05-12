//
//  RSSFeed.swift
//  Podcasts
//
//  Created by Simon on 12.05.2018.
//  Copyright © 2018 Simon. All rights reserved.
//

import FeedKit

extension RSSFeed {
    
    func toEpisode() -> [Episode] {
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        
        var episodes = [Episode]()
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageUrl == nil {
                episode.imageUrl = imageUrl
            }
            
            episodes.append(episode)
        })
        
        return episodes
    }
}
