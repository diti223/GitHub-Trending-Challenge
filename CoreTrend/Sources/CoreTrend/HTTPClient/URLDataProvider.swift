//
//  URLDataProvider.swift
//  Trend
//
//  Created by Adrian Bilescu on 10.07.2022.
//

import Foundation

public class URLDataProvider: DataProvider {
    let url: URL
    let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func fetchData(_ completion: @escaping ((Data?) -> Void)) {
        client.fetchData(from: url, completion: completion)
    }
}
