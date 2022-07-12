//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 01.07.2022.
//

import Foundation

public protocol RepositoryFetcher {
    func fetch(completion: @escaping ([Repository]) -> Void)
}
