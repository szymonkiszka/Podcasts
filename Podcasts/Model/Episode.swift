//
//  Episode.swift
//  Podcasts
//
//  Created by Simon on 03.05.2018.
//  Copyright © 2018 Simon. All rights reserved.
//

import Foundation
import FeedKit

struct Episode {
    let title: String
    let pubDate: Date
    let description: String
    let author: String
    let streamUrl: String
    
    var imageUrl: String?
    
    init(feedItem: RSSFeedItem) {
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
        
        
        
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.author = feedItem.iTunes?.iTunesAuthor ?? ""
        
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
    }
}
