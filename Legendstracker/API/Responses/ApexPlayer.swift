//
//  ApexPlayer.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let apexPlayer = try? newJSONDecoder().decode(ApexPlayer.self, from: jsonData)

import Foundation

struct ApexPlayer: Codable {
    let global: Global
    let realtime: Realtime
    let legends: Legends
    let mozambiquehereInternal: MozambiquehereInternal
    let als: Als
    let total: Total
    
    enum CodingKeys: String, CodingKey {
        case global = "global"
        case realtime = "realtime"
        case legends = "legends"
        case mozambiquehereInternal = "mozambiquehere_internal"
        case als = "ALS"
        case total = "total"
    }
}

struct Als: Codable {
    let isALSDataEnabled: Bool
    
    enum CodingKeys: String, CodingKey {
        case isALSDataEnabled = "isALSDataEnabled"
    }
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
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uid = "uid"
        case avatar = "avatar"
        case platform = "platform"
        case level = "level"
        case toNextLevelPercent = "toNextLevelPercent"
        case internalUpdateCount = "internalUpdateCount"
        case bans = "bans"
        case rank = "rank"
        case arena = "arena"
        case battlepass = "battlepass"
        case internalParsingVersion = "internalParsingVersion"
        case badges = "badges"
        case levelPrestige = "levelPrestige"
    }
}

struct Arena: Codable {
    let rankScore: Int
    let rankName: String
    let rankDiv: Int
    let ladderPosPlatform: Int
    let rankImg: String
    let rankedSeason: String
    
    enum CodingKeys: String, CodingKey {
        case rankScore = "rankScore"
        case rankName = "rankName"
        case rankDiv = "rankDiv"
        case ladderPosPlatform = "ladderPosPlatform"
        case rankImg = "rankImg"
        case rankedSeason = "rankedSeason"
    }
}

struct Damage: Codable {
    let name: String
    let value: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

struct Bans: Codable {
    let isActive: Bool
    let remainingSeconds: Int
    let lastBanReason: String
    
    enum CodingKeys: String, CodingKey {
        case isActive = "isActive"
        case remainingSeconds = "remainingSeconds"
        case lastBanReason = "last_banReason"
    }
}

struct Battlepass: Codable {
    let level: String
    let history: [String: Int]
    
    enum CodingKeys: String, CodingKey {
        case level = "level"
        case history = "history"
    }
}

struct Legends: Codable {
    let selected: SelectedLegend
    let all: AllLegends
    
    enum CodingKeys: String, CodingKey {
        case selected = "selected"
        case all = "all"
    }
}

struct AllLegends: Codable {
    let revenant: Legend
    let crypto: Legend
    let horizon: Legend
    let gibraltar: Legend
    let wattson: Legend
    let fuse: Legend
    let bangalore: Legend
    let wraith: Legend
    let octane: Legend
    let bloodhound: Bloodhound
    let caustic: Legend
    let lifeline: Legend
    let pathfinder: Legend
    let loba: Legend
    let mirage: Legend
    let rampart: Legend
    let valkyrie: Legend
    let seer: Legend
    let ash: Legend
    let madMaggie: Legend
    let newcastle: Legend
    let vantage: Legend
    
    enum CodingKeys: String, CodingKey {
        case revenant = "Revenant"
        case crypto = "Crypto"
        case horizon = "Horizon"
        case gibraltar = "Gibraltar"
        case wattson = "Wattson"
        case fuse = "Fuse"
        case bangalore = "Bangalore"
        case wraith = "Wraith"
        case octane = "Octane"
        case bloodhound = "Bloodhound"
        case caustic = "Caustic"
        case lifeline = "Lifeline"
        case pathfinder = "Pathfinder"
        case loba = "Loba"
        case mirage = "Mirage"
        case rampart = "Rampart"
        case valkyrie = "Valkyrie"
        case seer = "Seer"
        case ash = "Ash"
        case madMaggie = "Mad Maggie"
        case newcastle = "Newcastle"
        case vantage = "Vantage"
    }
}

struct Legend: Codable {
    let imgAssets: ImgAssets
    
    enum CodingKeys: String, CodingKey {
        case imgAssets = "ImgAssets"
    }
}

struct ImgAssets: Codable {
    let icon: String
    let banner: String
    
    enum CodingKeys: String, CodingKey {
        case icon = "icon"
        case banner = "banner"
    }
}

struct Bloodhound: Codable {
    let data: [BloodhoundDatum]
    let gameInfo: BloodhoundGameInfo
    let imgAssets: ImgAssets
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case gameInfo = "gameInfo"
        case imgAssets = "ImgAssets"
    }
}

struct BloodhoundDatum: Codable {
    let name: String
    let value: Int
    let key: String
    let rank: Rank
    let rankPlatformSpecific: Rank
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
        case key = "key"
        case rank = "rank"
        case rankPlatformSpecific = "rankPlatformSpecific"
    }
}

struct Rank: Codable {
    let rankPos: Int
    let topPercent: Double
    
    enum CodingKeys: String, CodingKey {
        case rankPos = "rankPos"
        case topPercent = "topPercent"
    }
}

struct BloodhoundGameInfo: Codable {
    let badges: [Damage]
    
    enum CodingKeys: String, CodingKey {
        case badges = "badges"
    }
}

struct SelectedLegend: Codable {
    let legendName: String
    let data: [SelectedDatum]
    let gameInfo: SelectedGameInfo
    let imgAssets: ImgAssets
    
    enum CodingKeys: String, CodingKey {
        case legendName = "LegendName"
        case data = "data"
        case gameInfo = "gameInfo"
        case imgAssets = "ImgAssets"
    }
}

struct SelectedDatum: Codable {
    let name: String
    let value: Int
    let key: String
    let global: Bool
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
        case key = "key"
        case global = "global"
    }
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
    
    enum CodingKeys: String, CodingKey {
        case skin = "skin"
        case skinRarity = "skinRarity"
        case frame = "frame"
        case frameRarity = "frameRarity"
        case pose = "pose"
        case poseRarity = "poseRarity"
        case intro = "intro"
        case introRarity = "introRarity"
        case badges = "badges"
    }
}

struct Badge: Codable {
    let name: String
    let value: Int
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
        case category = "category"
    }
}

struct MozambiquehereInternal: Codable {
    let isNewToDB: Bool
    let claimedBy: String
    let apiAccessType: String
    let clusterID: String
    let rateLimit: RateLimit
    let clusterSrv: String
    
    enum CodingKeys: String, CodingKey {
        case isNewToDB = "isNewToDB"
        case claimedBy = "claimedBy"
        case apiAccessType = "APIAccessType"
        case clusterID = "ClusterID"
        case rateLimit = "rate_limit"
        case clusterSrv = "clusterSrv"
    }
}

struct RateLimit: Codable {
    let maxPerSecond: Int
    let currentReq: Int?
    
    enum CodingKeys: String, CodingKey {
        case maxPerSecond = "max_per_second"
        case currentReq = "current_req"
    }
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
    
    enum CodingKeys: String, CodingKey {
        case lobbyState = "lobbyState"
        case isOnline = "isOnline"
        case isInGame = "isInGame"
        case canJoin = "canJoin"
        case partyFull = "partyFull"
        case selectedLegend = "selectedLegend"
        case currentState = "currentState"
        case currentStateSinceTimestamp = "currentStateSinceTimestamp"
        case currentStateAsText = "currentStateAsText"
    }
}

struct Total: Codable {
    let damage: Damage
    let enemiesScanned: Damage
    let specialEventKills: Damage
    let kd: Kd
    
    enum CodingKeys: String, CodingKey {
        case damage = "damage"
        case enemiesScanned = "enemies_scanned"
        case specialEventKills = "specialEvent_kills"
        case kd = "kd"
    }
}

struct Kd: Codable {
    let value: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
        case name = "name"
    }
}
