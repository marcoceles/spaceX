//
//  Rocket.swift
//  spaceX
//
//  Created by Marco Celestino on 17/02/2021.
//

import Foundation

// MARK: - Rocket
struct Rocket: Codable {
    let height: Diameter?
    let diameter: Diameter?
    let mass: Mass?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let engines: Engines?
    let landingLegs: LandingLegs?
    let payloadWeights: [PayloadWeight]?
    let flickrImages: [String]?
    let name: String?
    let type: String?
    let active: Bool?
    let stages: Int?
    let boosters: Int?
    let costPerLaunch: Int?
    let successRatePct: Int?
    let firstFlight: String?
    let country: String?
    let company: String?
    let wikipedia: String?
    let rocketDescription: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case height
        case diameter
        case mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name
        case type
        case active
        case stages
        case boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country
        case company
        case wikipedia
        case rocketDescription = "description"
        case id
    }
}

// MARK: - Diameter
struct Diameter: Codable {
    let meters: Double?
    let feet: Double?
}

// MARK: - Engines
struct Engines: Codable {
    let isp: ISP?
    let thrustSeaLevel: Thrust?
    let thrustVacuum: Thrust?
    let number: Int?
    let type: String?
    let version: String?
    let layout: String?
    let engineLossMax: Int?
    let propellant1: String?
    let propellant2: String?
    let thrustToWeight: Double?

    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number
        case type
        case version
        case layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

// MARK: - ISP
struct ISP: Codable {
    let seaLevel: Int?
    let vacuum: Int?

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

// MARK: - Thrust
struct Thrust: Codable {
    let kN: Int?
    let lbf: Int?
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let thrustSeaLevel: Thrust?
    let thrustVacuum: Thrust?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - LandingLegs
struct LandingLegs: Codable {
    let number: Int?
    let material: String?
}

// MARK: - Mass
struct Mass: Codable {
    let kg: Int?
    let lb: Int?
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    let id: String?
    let name: String?
    let kg: Int?
    let lb: Int?
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let thrust: Thrust?
    let payloads: Payloads?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case thrust
        case payloads
        case reusable
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Payloads
struct Payloads: Codable {
    let compositeFairing: CompositeFairing?
    let option1: String?

    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Codable {
    let height: Diameter?
    let diameter: Diameter?

    enum CodingKeys: String, CodingKey {
        case height
        case diameter
    }
}
