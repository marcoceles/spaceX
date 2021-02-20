//
//  RocketViewModelTests.swift
//  spaceXTests
//
//  Created by Marco Celestino on 20/02/2021.
//

import XCTest
import Combine

class RocketViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testGetRockets(){

        let expectation = self.expectation(description: "RocketList")
        var rockets: [Rocket]?

        let viewModel = RocketViewModel()
        var rocketsSubscriber : AnyCancellable?

        rocketsSubscriber = viewModel.dataSource
            .sink(
            receiveValue: { list in
                rockets = list
                expectation.fulfill()
            })

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssert(rockets != nil && rockets!.count > 0)
    }
}
