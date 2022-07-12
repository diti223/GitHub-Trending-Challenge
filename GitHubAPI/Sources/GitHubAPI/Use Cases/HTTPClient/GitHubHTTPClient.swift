//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 06.07.2022.
//

import Foundation
import CoreTrend
import Combine

public class GitHubAPI: DataProvider {
    
    let endPoint: GitHubEndPoint
    let client: HTTPClient
    
    private var subscribers: Set<AnyCancellable> = []
    
    public init(endPoint: GitHubEndPoint, client: HTTPClient) {
        self.endPoint = endPoint
        self.client = client
    }
    
    public func fetchData(_ completion: @escaping ((Data?) -> Void)) {
        client.fetchData(from: endPoint.url) { (data) in
            completion(data)
        }
    }
    
}

extension URLRequest {
    mutating func addHeader(_ header: HTTPHeader) {
        addValue(header.key, forHTTPHeaderField: header.value)
    }
}

