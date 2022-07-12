//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 01.07.2022.
//

import Foundation
import CoreTrend

extension Repository {
    static func makeDummy(id: String = "any-id") -> Repository {
        Repository(id: id, description: "", name: "someName", author: .makeDummy(), contributors: [], starsCount: 0, watchersCount: 0, cloneURL: .anyURL, languages: ["Swift"], created: .init(), updated: .init(), isFork: false, forksCount: 0, license: .makeDummy(), defaultBranch: "main")
    }
}

extension User {
    static func makeDummy() -> User {
        User(username: "some user name", avatarURL: nil, profileURL: .anyURL)
    }
}

extension License {
    static func makeDummy() -> License {
        .mit
    }
}

extension URL {
    static let anyURL = URL(string: "https://any-url.com")!
}
