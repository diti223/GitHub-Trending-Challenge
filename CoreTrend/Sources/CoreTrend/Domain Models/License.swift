//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 01.07.2022.
//

import Foundation

public enum License: Equatable {
    case mit
    case apache
    case gnu
    
    var name: String {
        switch self {
            case .mit:
                return "MIT License"
            case .apache:
                return "Apache License 2.0"
            case .gnu:
                return "GNU General Public License v3.0"
        }
    }
    
    var url: URL {
        switch self {
            case .mit:
                return URL(string: "https://spdx.org/licenses/MIT.html")!
            case .apache:
                return URL(string: "http://www.apache.org/licenses/")!
            case .gnu:
                return URL(string: "https://spdx.org/licenses/GPL-3.0-or-later.html")!
        }
    }
}
