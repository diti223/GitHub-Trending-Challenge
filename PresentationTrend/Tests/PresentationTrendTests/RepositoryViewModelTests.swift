//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 11.07.2022.
//

import CoreTrend
import XCTest
import PresentationTrend

class RepositoryViewModelTests: XCTestCase {
    func testOnInit_FetchedDataIsNil() {
        let (sut, _) = makeSUT()
        
        XCTAssertNil(sut.fetchedData)
    }
    
    func testOnInit_DoesntFetchData() {
        let (_, spy) = makeSUT()
        
        XCTAssertEqual(spy.invokedFetchesCount, 0)
    }
    
    func testOnFetch_HavingNilData_FetchesData() {
        let (sut, spy) = makeSUT()
        
        sut.fetch()
        
        XCTAssertEqual(spy.invokedFetchesCount, 1)
    }
    
    func testOnFetchingTwice_HavingNilData_InvokesFetchDataTwice() {
        let (sut, spy) = makeSUT()
        
        sut.fetch()
        sut.fetch()
        
        XCTAssertEqual(spy.invokedFetchesCount, 2)
    }
    
    func testOnFetch_HavingData_DoesntFetchData() {
        let (sut, spy) = makeSUT()
        
        sut.fetch()
        spy.sendData("some-data".data(using: .utf8)!, at: 0)
        
        sut.fetch()
        
        XCTAssertEqual(spy.invokedFetchesCount, 1)
    }
    
    private func makeSUT(repository: Repository = Repository.makeDummy()) -> (RepositoryViewModel, HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RepositoryViewModel(repository: repository, httpClient: client)
        
        trackForMemoryLeaks(client)
        trackForMemoryLeaks(sut)
        
        return (sut, client)
    }
}


class HTTPClientSpy: HTTPClient {
    init() {
        // we don't care about the session and we try not to invoke it
        super.init(session: .shared)
    }
    
    struct Message {
        let request: URLRequest
        let completion: ((Data?) -> Void)
    }
    
    var invokedFetchesCount: Int {
        invokedMessages.count
    }
    
    var invokedMessages: [Message] = []
    override func fetchData(from request: URLRequest, completion: @escaping ((Data?) -> Void)) {
        invokedMessages.append(Message(request: request, completion: completion))
    }
    
    func sendData(_ data: Data?, at index: Int) {
        invokedMessages[index].completion(data)
    }
}

