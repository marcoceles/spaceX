//
//  Rocket.swift
//  spaceX
//
//  Created by Marco Celestino on 17/02/2021.
//

import Foundation

// MARK: - Rocket
struct Rocket: Codable {
    let id: Int
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int
    let firstFlight: String
    let country: String
    let company: String
    let height: Diameter
    let diameter: Diameter
    let mass: Mass
    let payloadWeights: [PayloadWeight]
    let firstStage: FirstStage
    let secondStage: SecondStage
    let engines: Engines
    let landingLegs: LandingLegs
    let wikipedia: String
    let rocketDescription: String
    let rocketID: String
    let rocketName: String
    let rocketType: String

    enum CodingKeys: String, CodingKey {
        case id
        case active
        case stages
        case boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country
        case company
        case height
        case diameter
        case mass
        case payloadWeights = "payload_weights"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case wikipedia
        case rocketDescription = "description"
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
}

// MARK: - Diameter
struct Diameter: Codable {
    let meters: Double
    let feet: Double
}

// MARK: - Engines
struct Engines: Codable {
    let number: Int
    let type: String
    let version: String
    let layout: String
    let engineLossMax: Int
    let propellant1: String
    let propellant2: String
    let thrustSeaLevel: Thrust
    let thrustVacuum: Thrust
    let thrustToWeight: Int

    enum CodingKeys: String, CodingKey {
        case number
        case type
        case version
        case layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case thrustToWeight = "thrust_to_weight"
    }
}

// MARK: - Thrust
struct Thrust: Codable {
    let kN: Int
    let lbf: Int
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int
    let thrustSeaLevel: Thrust
    let thrustVacuum: Thrust

    enum CodingKeys: String, CodingKey {
        case reusable
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
    }
}

// MARK: - LandingLegs
struct LandingLegs: Codable {
    let number: Int
}

// MARK: - Mass
struct Mass: Codable {
    let kg: Int
    let lb: Int
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int
    let thrust: Thrust
    let payloads: Payloads

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
        case thrust
        case payloads
    }
}

// MARK: - Payloads
struct Payloads: Codable {
    let option1: String
    let compositeFairing: CompositeFairing

    enum CodingKeys: String, CodingKey {
        case option1 = "option_1"
        case compositeFairing = "composite_fairing"
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Codable {
    let height: Diameter
    let diameter: Diameter
}

