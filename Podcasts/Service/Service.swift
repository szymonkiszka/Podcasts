//
//  Service.swift
//  Podcasts
//
//  Created by Simon on 03.05.2018.
//  Copyright © 2018 Simon. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    
    let baseItunesSearchURL = "https://itunes.apple.com/search"
    
    //singleton
    static let shared = Service()
    
    func fetchPodcasts(searchText: String, complitionHandler: @escaping ([Podcast]) -> ()) {
        print("Searching for podcast...")
        
        let parameters = ["term": searchText, "media": "podcast"]
        
        Alamofire.request(baseItunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            if let err = dataResponse.error {
                print("Failed to connect yahoo", err)
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                print(3)
                let searchResult =  try JSONDecoder().decode(SearchResults.self, from: data)
                
                complitionHandler(searchResult.results)
//                self.podcasts = searchResult.results
//                self.tableView.reloadData()
                
            } catch let decodeErr {
                print("Failed to decode: ", decodeErr)
            }
        }
        
        print(2)
        
    }
    
    struct SearchResults: Decodable {
        let resultCount: Int
        let results: [Podcast]
    }
    
}
