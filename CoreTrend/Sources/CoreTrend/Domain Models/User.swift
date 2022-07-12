//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 01.07.2022.
//

import Foundation

public struct User: Equatable {
    public let username: String
    public let avatarURL: URL?
    public let profileURL: URL

    public init(username: String, avatarURL: URL?, profileURL: URL) {
        self.username = username
        self.avatarURL = avatarURL
        self.profileURL = profileURL
    }
}
