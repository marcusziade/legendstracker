//
//  MapRotationResponse.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mapRotationResponse = try? newJSONDecoder().decode(MapRotationResponse.self, from: jsonData)

import Foundation

struct MapRotationResponse: Codable {
    let current: Current
    let next: Next
}

struct Current: Codable {
    let start: Int
    let end: Int
    let readableDateStart: String
    let readableDateEnd: String
    let map: String
    let code: String
    let durationInSecs: Int
    let durationInMinutes: Int
    let asset: String
    let remainingSecs: Int
    let remainingMins: Int
    let remainingTimer: String
}

struct Next: Codable {
    let start: Int
    let end: Int
    let readableDateStart: String
    let readableDateEnd: String
    let map: String
    let code: String
    let durationInSecs: Int
    let durationInMinutes: Int
}

