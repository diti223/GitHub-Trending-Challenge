//
//  Dependencies.swift
//  Trend
//
//  Created by Adrian Bilescu on 10.07.2022.
//

import Foundation
import Combine
import CoreTrend

class Dependencies: ObservableObject {
    let httpClient: HTTPClient
    let repositoryFetcher: RepositoryFetcher
    
    init(httpClient: HTTPClient, repositoryFetcher: RepositoryFetcher) {
        self.httpClient = httpClient
        self.repositoryFetcher = repositoryFetcher
    }
}
