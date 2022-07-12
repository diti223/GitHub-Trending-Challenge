//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 07.07.2022.
//

import Foundation

public enum HTTPHeader {
    case accept(String)
}

extension HTTPHeader {
    public var key: String {
        switch self {
            case .accept:
                return "Accept"
        }
    }
    
    public var value: String {
        switch self {
            case .accept(let value):
                return value
        }
    }
}
