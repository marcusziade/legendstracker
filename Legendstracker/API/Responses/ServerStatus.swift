//
//  ServerStatus.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let serverStatus = try? newJSONDecoder().decode(ServerStatus.self, from: jsonData)

import Foundation
import SwiftUI

struct ServerStatus: Codable {
    let originLogin: Servers
    let eaNovafusion: Servers
    let eaAccounts: Servers
    let apexOauthCrossplay: Servers
    let selfCoreTest: SelfCoreTest
    let otherPlatforms: OtherPlatforms
    
    enum CodingKeys: String, CodingKey {
        case originLogin = "Origin_login"
        case eaNovafusion = "EA_novafusion"
        case eaAccounts = "EA_accounts"
        case apexOauthCrossplay = "ApexOauth_Crossplay"
        case selfCoreTest = "selfCoreTest"
        case otherPlatforms = "otherPlatforms"
    }
}

struct Servers: Codable {
    let euWest: Region
    let euEast: Region
    let usWest: Region
    let usCentral: Region
    let usEast: Region
    let southAmerica: Region
    let asia: Region
    
    enum CodingKeys: String, CodingKey {
        case euWest = "EU-West"
        case euEast = "EU-East"
        case usWest = "US-West"
        case usCentral = "US-Central"
        case usEast = "US-East"
        case southAmerica = "SouthAmerica"
        case asia = "Asia"
    }
}

struct Region: Codable {
    let status: Status
    let httpCode: Int
    let responseTime: Int
    let queryTimestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case httpCode = "HTTPCode"
        case responseTime = "ResponseTime"
        case queryTimestamp = "QueryTimestamp"
    }
}

enum Status: String, Codable {
    case down = "DOWN"
    case slow = "SLOW"
    case up = "UP"
    
    var color: Color {
        switch self {
        case .down: return .red
        case .slow: return .yellow
        case .up:   return .green
        }
    }
    
    var icon: String {
        switch self {
        case .down: return "xmark.icloud.fill"
        case .slow: return "exclamationmark.icloud.fill"
        case .up:   return "checkmark.icloud.fill"
        }
    }
}

struct OtherPlatforms: Codable {
    let playstationNetwork: PlaystationNetwork
    let xboxLive: PlaystationNetwork
    
    enum CodingKeys: String, CodingKey {
        case playstationNetwork = "Playstation-Network"
        case xboxLive = "Xbox-Live"
    }
}

struct PlaystationNetwork: Codable {
    let status: Status
    let queryTimestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case queryTimestamp = "QueryTimestamp"
    }
}

struct SelfCoreTest: Codable {
    let statusWebsite: Region
    let statsAPI: Region
    let overflow1: Region
    let overflow2: Region
    let originAPI: Region
    let playstationAPI: Region
    let xboxAPI: Region
    
    enum CodingKeys: String, CodingKey {
        case statusWebsite = "Status-website"
        case statsAPI = "Stats-API"
        case overflow1 = "Overflow-#1"
        case overflow2 = "Overflow-#2"
        case originAPI = "Origin-API"
        case playstationAPI = "Playstation-API"
        case xboxAPI = "Xbox-API"
    }
}
