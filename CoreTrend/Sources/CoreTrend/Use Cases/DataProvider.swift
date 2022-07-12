//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 06.07.2022.
//

import Foundation

public protocol DataProvider {
    typealias Result = Data?
    func fetchData(_ completion: @escaping ((DataProvider.Result) -> Void))
}
