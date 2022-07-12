//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 01.07.2022.
//

import Foundation

public struct Repository: Equatable {
    public let id: String
    public let name: String
    public let description: String
    public let author: User
    public var contributors: [User]
    public let starsCount: Int
    public let watchersCount: Int
    public let cloneURL: URL
    public let languages: [String]
    public let created: Date
    public let updated: Date
    public let isFork: Bool
    public let forksCount: Int
    public let license: License?
    public let defaultBranch: String
    
    public init(id: String, description: String, name: String, author: User, contributors: [User], starsCount: Int, watchersCount: Int, cloneURL: URL, languages: [String], created: Date, updated: Date, isFork: Bool, forksCount: Int, license: License?, defaultBranch: String) {
        self.id = id
        self.description = description
        self.name = name
        self.author = author
        self.starsCount = starsCount
        self.contributors = contributors
        self.watchersCount = watchersCount
        self.cloneURL = cloneURL
        self.languages = languages
        self.created = created
        self.updated = updated
        self.isFork = isFork
        self.forksCount = forksCount
        self.license = license
        self.defaultBranch = defaultBranch
    }
}

