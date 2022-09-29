//
//  ServerStatus.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let serverStatus = try? newJSONDecoder().decode(ServerStatus.self, from: jsonData)

import Foundation

struct ServerStatus: Codable {
    let originLogin: ApexOauthCrossplay
    let eaNovafusion: ApexOauthCrossplay
    let eaAccounts: ApexOauthCrossplay
    let apexOauthCrossplay: ApexOauthCrossplay
    let selfCoreTest: SelfCoreTest
    let otherPlatforms: OtherPlatforms
}

struct ApexOauthCrossplay: Codable {
    let euWest: Asia
    let euEast: Asia
    let usWest: Asia
    let usCentral: Asia
    let usEast: Asia
    let southAmerica: Asia
    let asia: Asia
}

struct Asia: Codable {
    let status: Status
    let httpCode: Int
    let responseTime: Int
    let queryTimestamp: Int
}

enum Status: String, Codable {
    case down = "DOWN"
    case slow = "SLOW"
    case up = "UP"
}

struct OtherPlatforms: Codable {
    let playstationNetwork: PlaystationNetwork
    let xboxLive: PlaystationNetwork
}

struct PlaystationNetwork: Codable {
    let status: Status
    let queryTimestamp: Int
}

struct SelfCoreTest: Codable {
    let statusWebsite: Asia
    let statsAPI: Asia
    let overflow1: Asia
    let overflow2: Asia
    let originAPI: Asia
    let playstationAPI: Asia
    let xboxAPI: Asia
}
