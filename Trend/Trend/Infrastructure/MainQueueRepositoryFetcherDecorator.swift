//
//  MainQueueRepositoryFetcherDecorator.swift
//  Trend
//
//  Created by Adrian Bilescu on 11.07.2022.
//

import Foundation
import CoreTrend

struct MainQueueRepositoryFetcherDecorator: RepositoryFetcher {
    let fetcher: RepositoryFetcher
    
    func fetch(completion: @escaping ([Repository]) -> Void) {
        fetcher.fetch { data in
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
