//
//  DummyFetcher.swift
//  Trend
//
//  Created by Adrian Bilescu on 01.07.2022.
//

import Foundation
import CoreTrend

struct DummyRepositoryFetcher: RepositoryFetcher {
    func fetch(completion: @escaping ([Repository]) -> Void) {
        completion(Repository.dummies1)
    }
}

extension Repository {
    private static func makeUser() -> User {
        User(username: UUID().uuidString, avatarURL: URL(string: "https://avatars.githubusercontent.com/u/3709715?v=4")!, profileURL: URL(string: "https://github.com/WhaleFell")!)
    }
    
    static var dummies1: [Repository] {
        [
            Repository(id: "some-id", description: "短信轰炸/短信测压/ | 一个健壮免费的python短信轰炸程序，专门炸坏蛋蛋，百万接口，多线程全自动添加有效接口，支持异步协程百万并发，全免费的短信轰炸工具！！高一美术生开发全网首发！！", name: "SMSBoom", author: User(username: "WhaleFell", avatarURL: URL(string: "https://preview.redd.it/cdqbim3suv891.jpg?width=640&crop=smart&auto=webp&s=30cf2f9aaaf29a91a1a4f1fb86548239ee77b198")!, profileURL: URL(string: "https://github.com/WhaleFell")!), contributors: [makeUser(), makeUser(), makeUser(), makeUser()], starsCount: 2500, watchersCount: 17, cloneURL: URL(string: "https://github.com/WhaleFell/SMSBoom.git")!, languages: ["Python", "JavaScript", "HTML"], created: Date().addingTimeInterval(-60*60*24*7 * 52 * 3), updated: Date().addingTimeInterval(-60*60*24 * 3), isFork: false, forksCount: 584, license: .apache, defaultBranch: "main"),
            
            Repository(id: "realm/SwiftLint", description: "A tool to enforce Swift style and conventions." , name: "SwiftLint", author: User(username: "realm", avatarURL: URL(string: "https://preview.redd.it/uizmjirf5w891.jpg?width=640&crop=smart&auto=webp&s=9678878a54bac575dd80423c18afb450bce74879")!, profileURL: URL(string: "https://github.com/realm")!), contributors: [.user1, .user2], starsCount: 16200, watchersCount: 249, cloneURL: URL(string: "https://github.com/realm/SwiftLint.git")!, languages: ["Swift", "Ruby", "Makefile", "HTML", "Roff", "Dockerfile"], created: Date().addingTimeInterval(-60*60*24*7 * 52 * 3), updated: Date().addingTimeInterval(-60*60*24 * 3), isFork: false, forksCount: 1900, license: .mit, defaultBranch: "master"),
            
            Repository(id: "123", description: "" , name: "Lorem", author: User(username: "john.doe", avatarURL: nil, profileURL: URL(string: "https://google.com")!), contributors: (0..<20).map({ _ in makeUser()}), starsCount: 1, watchersCount: 2, cloneURL: URL(string: "https://apple.com")!, languages: ["Swift"], created: .init(), updated: .init(), isFork: true, forksCount: 1, license: .mit, defaultBranch: "main"),
            
            Repository(id: "2", description: "" , name: "Repo 2", author: User(username: "john.doe", avatarURL: nil, profileURL: URL(string: "https://google.com")!), contributors: [], starsCount: 0, watchersCount: 2, cloneURL: URL(string: "https://apple.com")!, languages: ["Swift"], created: .init(), updated: .init(), isFork: true, forksCount: 1000, license: .mit, defaultBranch: "main"),
            
            Repository(id: "3", description: "" , name: "Repo 3", author: User(username: "john.doe", avatarURL: nil, profileURL: URL(string: "https://google.com")!), contributors: [], starsCount: 5900, watchersCount: 2, cloneURL: URL(string: "https://apple.com")!, languages: ["Swift"], created: .init(), updated: .init(), isFork: true, forksCount: 1200, license: .mit, defaultBranch: "main"),
            
            Repository(id: "123", description: "" , name: "Lorem", author: User(username: "john.doe", avatarURL: nil, profileURL: URL(string: "https://google.com")!), contributors: [], starsCount: 100, watchersCount: 2, cloneURL: URL(string: "https://apple.com")!, languages: ["Swift"], created: .init(), updated: .init(), isFork: true, forksCount: 100, license: .mit, defaultBranch: "main"),
            
            Repository(id: "2", description: "" , name: "Repo 2", author: User(username: "john.doe", avatarURL: nil, profileURL: URL(string: "https://google.com")!), contributors: [], starsCount: 100, watchersCount: 2, cloneURL: URL(string: "https://apple.com")!, languages: ["Swift"], created: .init(), updated: .init(), isFork: true, forksCount: 100, license: .mit, defaultBranch: "main"),
            
            Repository(id: "3", description: "" , name: "Repo 3", author: User(username: "john.doe", avatarURL: nil, profileURL: URL(string: "https://google.com")!), contributors: [], starsCount: 100, watchersCount: 2, cloneURL: URL(string: "https://apple.com")!, languages: ["Swift"], created: .init(), updated: .init(), isFork: true, forksCount: 100, license: .mit, defaultBranch: "main")
        ]
    }
}
