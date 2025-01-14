//
//  TeamDetailViewModelTests.swift
//  FootballLeagueAppTests
//
//  Created by David Ali on 14/01/25.
//

import XCTest
@testable import FootballLeagueApp

final class TeamDetailViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_viewModelFetchingStateInitialStatus() {
        let fetchingStateExpectedValue = FetchingState.inProgress
        let sut = TeamDetailViewModel()
        
        XCTAssertEqual(sut.fetchState, fetchingStateExpectedValue,
                       "fetchState must be equal to \(fetchingStateExpectedValue) on initialization")
    }
    
    func test_viewModelFetchingStateAfterCompletingFetch() async {
        let fetchingStateExpectedValue = FetchingState.completed
        let sut = TeamDetailViewModel(source: TeamDetailSourceStub())
        await sut.fetchDetail(for: "name")
        
        XCTAssertEqual(sut.fetchState, fetchingStateExpectedValue,
                       "fetchState must be equal to \(fetchingStateExpectedValue) after completing fetch")
    }
}
