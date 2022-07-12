//
//  TrendApp.swift
//  Trend
//
//  Created by Adrian Bilescu on 30.06.2022.
//

import SwiftUI
import GitHubAPI
import CoreTrend

@main
struct TrendApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(Dependencies.makeDefault(session: .shared))
        }
    }
}

extension Dependencies {
    static func makeAPIRepositoryFetcher(with client: HTTPClient) -> APIRepositoryFetcher {
        APIRepositoryFetcher(dataProvider: GitHubAPI(endPoint: .search, client: client))
        
    }
    
    static func makeDefault(session: URLSession) -> Dependencies {
        let httpClient = HTTPClient(session: session)
        return Dependencies(httpClient: httpClient, repositoryFetcher: makeAPIRepositoryFetcher(with: httpClient))
    }
    
    static var dummy = Dependencies(
        httpClient: HTTPClient(session: .shared),
        repositoryFetcher: DummyRepositoryFetcher()
    )
}
