//
//  RepositoriesListViewModel.swift
//  
//
//  Created by Adrian Bilescu on 01.07.2022.
//

import Foundation
import CoreTrend
import XCTest
import PresentationTrend

class RepositoriesListViewModelTests: XCTestCase {
    func testOnInit_ListIsEmpty() {
        let (sut, _) = makeSUT()
        XCTAssertEqual(sut.list.isEmpty, true)
    }
    
    func testOnFetchData_InvokesFetchRepositoriesOnce() async {
        let (sut, fetcher) = makeSUT()
        
        sut.fetchData()
        
        XCTAssertEqual(fetcher.invokedFetchCount, 1)
    }
    
    func testOnReceivingRepositories_SetsListWithRepositories() async {
        let (sut, fetcher) = makeSUT()
        let repositories = [
            Repository.makeDummy(id: "1"),
            Repository.makeDummy(id: "2")
        ]
        
        sut.fetchData()
        fetcher.complete(with: repositories, at: 0)
        
        
        let expected = repositories
        let actual = sut.list
        XCTAssertEqual(actual, expected)
    }
    
    func testViewDidAppear_EmptyList_FetchesData() {
        let (sut, fetcher) = makeSUT()
        
        sut.viewDidAppear()
        
        XCTAssertEqual(fetcher.invokedFetchCount, 1)
    }
    
    
    
    func testViewDidAppear_NonEmptyList_FetchesData() {
        let (sut, fetcher) = makeSUT()
        
        let repositories = [
            Repository.makeDummy(id: "1"),
            Repository.makeDummy(id: "2")
        ]
        
        sut.viewDidAppear()
        fetcher.complete(with: repositories, at: 0)
        
        XCTAssertEqual(fetcher.invokedFetchCount, 1)
    }
    
    private func makeSUT() -> (RepositoriesListViewModel, RepositoryFetcherSpy) {
        let fetcher = RepositoryFetcherSpy()
        let sut = RepositoriesListViewModel(fetcher: fetcher)
        
        trackForMemoryLeaks(fetcher)
        trackForMemoryLeaks(sut)
        
        return (sut, fetcher)
    }
}

class RepositoryFetcherSpy: RepositoryFetcher {
    var invokedFetchCount: Int {
        fetchCompletions.count
    }
    var fetchCompletions: [(([Repository]) -> Void)] = []
    func fetch(completion: @escaping ([Repository]) -> Void) {
        fetchCompletions.append(completion)
    }
    
    func complete(with repositories: [Repository], at index: Int) {
        fetchCompletions[index](repositories)
    }
}
