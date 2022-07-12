//
//  HTTPClient.swift
//  Trend
//
//  Created by Adrian Bilescu on 09.07.2022.
//

import Foundation

open class HTTPClient {
    let session: URLSession

    public init(session: URLSession) {
        self.session = session
    }
    
    open func fetchData(from request: URLRequest, completion: @escaping ((Data?) -> Void)) {
        debugPrint(request)
        session.dataTask(with: request) { (data, response, error) in
            
            if let response = response {
                debugPrint(response)
            }
            if let urlResponse = response as? HTTPURLResponse {
                debugPrint(urlResponse.statusCode)
            }
            if let error = error {
                debugPrint(error)
            }
            completion(data)
        }.resume()
    }
}

extension HTTPClient {
    public func fetchData(from url: URL, completion: @escaping ((Data?) -> Void)) {
        fetchData(from: URLRequest(url: url), completion: completion)
    }
}

