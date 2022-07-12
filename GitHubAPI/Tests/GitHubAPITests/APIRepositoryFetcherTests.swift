//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 06.07.2022.
//

import Foundation
import CoreTrend
import XCTest
import GitHubAPI


class APIRepositoryFetcherTests: XCTestCase {
    func testFetchRepositories_FetchesDataOnce() {
        let (sut, spy) = makeSUT()
        
        sut.fetch { _ in }
        
        XCTAssertEqual(spy.invokedFetchDataCount, 1)
    }
    
    func testFetchValidResponse() {
        let (sut, spy) = makeSUT()
        
        let promise = expectation(description: "Invoke fetch")
        
        sut.fetch { repositories in
            let dataFormater = ISO8601DateFormatter()
            let expected = [Repository(id: "44838949", description: "The Swift Programming Language", name: "swift", author: User(username: "apple", avatarURL: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")!, profileURL: URL(string: "https://github.com/apple")!), contributors: [], starsCount: 60019, watchersCount: 60019, cloneURL: URL(string: "https://github.com/apple/swift.git")!, languages: ["C++"], created: dataFormater.date(from: "2015-10-23T21:15:07Z")!, updated: dataFormater.date(from: "2022-07-06T09:59:04Z")!, isFork: false, forksCount: 9660, license: .apache, defaultBranch: "main")]
            let actual = repositories

            promise.fulfill()
            XCTAssertEqual(actual, expected)
        }
        
        let jsonPageFormat =
"""
{
    "total_count": 1020850,
    "incomplete_results": false,
    "items": [%@]
}
"""
        let pageResult = String(format: jsonPageFormat, String(data: JSONSample.appleSwift, encoding: .utf8)!).data(using: .utf8)
        spy.sendFetch(result: pageResult, at: 0)
        wait(for: [promise], timeout: 0.1)
    }
    
    func testInvalidResponse_ReturnsEmptyList() {
        let (sut, spy) = makeSUT()
        
        let promise = expectation(description: "Invoke fetch")
        
        sut.fetch { repositories in
            
            promise.fulfill()
            XCTAssertEqual(repositories, [])
        }
        
        let invalidJSON = "this is not a json".data(using: .utf8)
        spy.sendFetch(result: invalidJSON, at: 0)
        wait(for: [promise], timeout: 0.1)
    }
    
    private func makeSUT() -> (APIRepositoryFetcher, DataProviderSpy) {
        let spy = DataProviderSpy()
        let sut = APIRepositoryFetcher(dataProvider: spy)
        trackForMemoryLeaks(spy)
        return (sut, spy)
    }
}

class DataProviderSpy: DataProvider {
    var invokedFetchDataCount: Int {
        invokedFetchDataCompletions.count
    }
    var invokedFetchDataCompletions: [((DataProvider.Result) -> Void)] = []
    func fetchData(_ completion: @escaping ((DataProvider.Result) -> Void)) {
        invokedFetchDataCompletions.append(completion)
    }
    
    func sendFetch(result: DataProvider.Result, at index: Int) {
        invokedFetchDataCompletions[index](result)
    }
}
