//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 06.07.2022.
//

import Foundation
import CoreTrend

public struct APIRepositoryFetcher: RepositoryFetcher {
    let dataProvider: DataProvider
    
    public init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
    public func fetch(completion: @escaping ([Repository]) -> Void) {
        dataProvider.fetchData { result in
            let repositories = APIRepositoryFetcherMapper.map(result: result)
            completion(repositories)
        }
    }
}

private enum APIRepositoryFetcherMapper {
    static func map(result: Data?) -> [Repository] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        guard let data = result else {
            return []
        }
        do {
            let repositories = try decoder.decode(APIPage.self, from: data).items
            return repositories.map(Repository.init(api:))
        } catch {
            debugPrint("Failed to decode response: \(error)")
        }

        return []
    }
}

