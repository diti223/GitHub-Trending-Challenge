//
//  RepositoryViewModel.swift
//  Trend
//
//  Created by Adrian Bilescu on 11.07.2022.
//

import Foundation
import CoreTrend

public class RepositoryViewModel: ObservableObject {
    public var repository: Repository
    @Published public var isFavoriteRepository: Bool = false
    @Published public var fetchedData: Data?
    
    private let remoteDataProvider: URLDataProvider
    
    public init(repository: Repository, httpClient: HTTPClient) {
        self.repository = repository
        // force unwrapping is not desired
        //TODO: implement scenario where url fails, like repo without any branch
        self.remoteDataProvider = URLDataProvider(url: repository.readmeURL!, client: httpClient)
    }
    
    public func fetch() {
        guard fetchedData == nil else {
            return
        }
        
        remoteDataProvider.fetchData { [weak self] data in
            self?.fetchedData = data
        }
    }
}

extension Repository {
    var readmeURL: URL? {
        guard let username = author.username.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let repoName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let branch = defaultBranch.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            return nil
        }
        
        return URL(string: "https://raw.githubusercontent.com/\(username)/\(repoName)/\(branch)/README.md")
    }
}
