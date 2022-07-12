//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 06.07.2022.
//

import Foundation
import CoreTrend

struct APILicense: Decodable {
    let key: String
}

extension License {
    init?(api: APILicense?) {
        switch api?.key {
            case "apache-2.0":
                self = .apache
            case "mit":
                self = .mit
            case "gnu":
                self = .gnu
            default:
                return nil
        }
    }
}
