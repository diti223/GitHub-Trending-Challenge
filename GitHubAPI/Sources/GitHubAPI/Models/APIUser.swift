//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 06.07.2022.
//

import Foundation
import CoreTrend

struct APIUser: Decodable {
    
    let login: String
    let avatar_url: URL?
    let html_url: URL
}

extension User {
    init(api: APIUser) {
        self.init(username: api.login, avatarURL: api.avatar_url, profileURL: api.html_url)
    }
}

