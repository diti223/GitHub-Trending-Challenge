//
//  RepositoriesListViewModel.swift
//  
//
//  Created by Adrian Bilescu on 01.07.2022.
//

import Foundation
import CoreTrend

public class RepositoriesListViewModel: ObservableObject {
    @Published public var list: [Repository] = []
    private let fetcher: RepositoryFetcher
    
    @Published public var isLoading: Bool = false
    
    public init(fetcher: RepositoryFetcher) {
        self.fetcher = fetcher
    }
    
    public func fetchData() {
        isLoading = true
        fetcher.fetch { [weak self] repositories in
            self?.isLoading = false
            self?.list = repositories
        }
    }
    
    public func viewDidAppear() {
        guard list.isEmpty else {
            return
        }
        
        fetchData()
    }
}
