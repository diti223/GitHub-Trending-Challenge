//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 07.07.2022.
//

import Foundation

public enum GitHubEndPoint: String {
    case search
    
    var component: String {
        switch self {
            case .search:
                return "search/repositories"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
            case .search:
                return [
                    URLQueryItem(name: "q", value: "language:swift"),
                    URLQueryItem(name: "sort", value: "updated"),
                    URLQueryItem(name: "order", value: "desc"),
                    URLQueryItem(name: "per_page", value: "10"),
                    URLQueryItem(name: "page", value: "1")
                ]
        }
    }
    static let base = URL(string: "https://api.github.com")!
    
    var url: URL {
        let baseURL = GitHubEndPoint.base.appendingPathComponent(component)
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        return components?.url ?? baseURL
    }
}
