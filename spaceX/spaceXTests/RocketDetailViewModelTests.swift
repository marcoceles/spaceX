//
//  RocketDetailViewModelTests.swift
//  spaceXTests
//
//  Created by Marco Celestino on 20/02/2021.
//

import XCTest

class RocketDetailViewModelTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testText_Name(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: true, stages: nil, boosters: nil, costPerLaunch: 1000000, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.item.name, "CelesX")
    }

    func testImageUrl_Nil(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: true, stages: nil, boosters: nil, costPerLaunch: 1000000, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")
            
        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertNil(viewModel.imageUrl)
    }

    func testImageUrl(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: ["https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg"], name: "CelesX", type: nil, active: true, stages: nil, boosters: nil, costPerLaunch: 1000000, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertNotNil(viewModel.imageUrl)
    }

    func testText_StatusActive(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: true, stages: nil, boosters: nil, costPerLaunch: 1000000, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.status, "ACTIVE")
    }

    func testText_StatusInactive(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: false, stages: nil, boosters: nil, costPerLaunch: 1000000, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.status, "INACTIVE")
    }

    func testColor_StatusActive(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: true, stages: nil, boosters: nil, costPerLaunch: 1000000, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.statusColor, .green)
    }

    func testColor_StatusInactive(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: false, stages: nil, boosters: nil, costPerLaunch: 1000000, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.statusColor, .red)
    }

    func testText_USDollarFormattedCost(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: false, stages: nil, boosters: nil, costPerLaunch: 1000000, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.costPerLaunch, "$1,000,000.00")
    }

    func testText_NilCost(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: false, stages: nil, boosters: nil, costPerLaunch: nil, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.costPerLaunch, "-")
    }

    func testText_SuccessRate(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: false, stages: nil, boosters: nil, costPerLaunch: nil, successRatePct: 100, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.successRate, "100%")
    }

    func testColor_SuccessRateRed(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: false, stages: nil, boosters: nil, costPerLaunch: nil, successRatePct: 20, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.successRateColor, .red)
    }

    func testColor_SuccessRateOrange(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: false, stages: nil, boosters: nil, costPerLaunch: nil, successRatePct: 50, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.successRateColor, .orange)
    }

    func testColor_SuccessRateGreen(){
        let rocket = Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: [], name: "CelesX", type: nil, active: false, stages: nil, boosters: nil, costPerLaunch: nil, successRatePct: 90, firstFlight: "2021-02-20", country: "Italy", company: nil, wikipedia: nil, rocketDescription: "My first Rocket", id: "1")

        let viewModel = RocketDetailViewModel(item: rocket)
        XCTAssertEqual(viewModel.successRateColor, .green)
    }
}
