//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 06.07.2022.
//

import Foundation
import CoreTrend

struct APIRepository: Decodable {
    let id: Int
    let name: String
    let description: String?
    let owner: APIUser
    let contributors_url: URL
    let stargazers_count: Int
    let watchers_count: Int
    let clone_url: URL
    let language: String
    let created_at: Date
    let updated_at: Date
    let fork: Bool
    let forks_count: Int
    let license: APILicense?
    let default_branch: String
}

extension Repository {
    init(api: APIRepository) {
        self.init(id: String(api.id), description: api.description ?? "", name: api.name, author: User(api: api.owner), contributors: [], starsCount: api.stargazers_count, watchersCount: api.watchers_count, cloneURL: api.clone_url, languages: [api.language], created: api.created_at, updated: api.updated_at, isFork: api.fork, forksCount: api.forks_count, license: License(api: api.license), defaultBranch: api.default_branch)
    }
}
