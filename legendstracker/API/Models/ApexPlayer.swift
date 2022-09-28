//
//  ApexPlayer.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let apexPlayer = try ApexPlayer(json)

import Foundation

struct ApexPlayer: Codable {
    let global: Global
    let realtime: Realtime
    let legends: Legends
    let mozambiquehereInternal: MozambiquehereInternal
    let als: Als
    let total: Total
}

struct Als: Codable {
    let isALSDataEnabled: Bool
}

struct Global: Codable {
    let name: String
    let uid: Int
    let avatar: String
    let platform: String
    let level: Int
    let toNextLevelPercent: Int
    let internalUpdateCount: Int
    let bans: Bans
    let rank: Arena
    let arena: Arena
    let battlepass: Battlepass
    let internalParsingVersion: Int
    let badges: [Damage]
    let levelPrestige: Int
}

struct Arena: Codable {
    let rankScore: Int
    let rankName: String
    let rankDiv: Int
    let ladderPosPlatform: Int
    let rankImg: String
    let rankedSeason: String
}

struct Damage: Codable {
    let name: String
    let value: Int
}

struct Bans: Codable {
    let isActive: Bool
    let remainingSeconds: Int
    let lastBanReason: String
}

struct Battlepass: Codable {
    let level: String
    let history: [String: Int]
}

struct Legends: Codable {
    let selected: Selected
    let all: All
}

struct All: Codable {
    let revenant: Ash
    let crypto: Ash
    let horizon: Ash
    let gibraltar: Ash
    let wattson: Ash
    let fuse: Ash
    let bangalore: Ash
    let wraith: Ash
    let octane: Ash
    let bloodhound: Bloodhound
    let caustic: Ash
    let lifeline: Ash
    let pathfinder: Ash
    let loba: Ash
    let mirage: Ash
    let rampart: Ash
    let valkyrie: Ash
    let seer: Ash
    let ash: Ash
    let madMaggie: Ash
    let newcastle: Ash
    let vantage: Ash
}

struct Ash: Codable {
    let imgAssets: ImgAssets
}

struct ImgAssets: Codable {
    let icon: String
    let banner: String
}

struct Bloodhound: Codable {
    let data: [BloodhoundDatum]
    let gameInfo: BloodhoundGameInfo
    let imgAssets: ImgAssets
}

struct BloodhoundDatum: Codable {
    let name: String
    let value: Int
    let key: String
    let rank: Rank
    let rankPlatformSpecific: Rank
}

struct Rank: Codable {
    let rankPos: Int
    let topPercent: Double
}

struct BloodhoundGameInfo: Codable {
    let badges: [Damage]
}

struct Selected: Codable {
    let legendName: String
    let data: [SelectedDatum]
    let gameInfo: SelectedGameInfo
    let imgAssets: ImgAssets
}

struct SelectedDatum: Codable {
    let name: String
    let value: Int
    let key: String
    let global: Bool
}

struct SelectedGameInfo: Codable {
    let skin: String
    let skinRarity: String
    let frame: String
    let frameRarity: String
    let pose: String
    let poseRarity: String
    let intro: String
    let introRarity: String
    let badges: [Badge]
}

struct Badge: Codable {
    let name: String
    let value: Int
    let category: String
}

struct MozambiquehereInternal: Codable {
    let isNewToDB: Bool
    let claimedBy: String
    let apiAccessType: String
    let clusterID: String
    let rateLimit: RateLimit
    let clusterSrv: String
}

struct RateLimit: Codable {
    let maxPerSecond: Int
    let currentReq: Int?
}

struct Realtime: Codable {
    let lobbyState: String
    let isOnline: Int
    let isInGame: Int
    let canJoin: Int
    let partyFull: Int
    let selectedLegend: String
    let currentState: String
    let currentStateSinceTimestamp: Int
    let currentStateAsText: String
}

struct Total: Codable {
    let damage: Damage
    let enemiesScanned: Damage
    let specialEventKills: Damage
    let kd: Kd
}

struct Kd: Codable {
    let value: String
    let name: String
}
