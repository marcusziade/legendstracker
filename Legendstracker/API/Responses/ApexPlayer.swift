import Foundation

struct ApexPlayer: Codable {

    // MARK: Global

    /// The player's username in Apex.
    var name: String { global?.name ?? "–" }
    /// The player's avatar URL.
    var avatarURL: URL? { URL(string: global?.avatar ?? "") }
    /// The platform the player is on.
    var platform: String { global?.platform ?? "–" }
    /// The player account level.
    var level: Int { global?.level ?? 0 }
    /// The percentage of progress towards the next rank in the game.
    var toNextLevelPrecent: Int {
        global?.toNextLevelPercent ?? 0
    }
    
    /// The title of the current Battle Royale (BR) season in the game.
    var rankedBrSeasonTitle: String {
        brRank.rankedSeason.replacingOccurrences(of: "_", with: " ").capitalized
    }
    
    /// The URL of the image associated with the player's current rank in the BR mode of the game.
    var rankedBrRankImageURL: URL? {
        URL(string: brRank.rankImg)
    }
    
    /// The title of the current Arena season in the game.
    var rankedArenaSeasonTitle: String {
        arenaRank.rankedSeason.replacingOccurrences(of: "_", with: " ").capitalized
    }
    
    /// The URL of the image associated with the player's current rank in the Arena mode of the game.
    var rankedArenaRankImageURL: URL? {
        URL(string: arenaRank.rankImg)
    }
    /// The player's Unique ID.
    var UID: String {
        if let uid = global?.uid {
            return String(uid)
        } else {
            return "–"
        }
    }
    /// The player's ban information.
    var bans: Bans {
        Bans(
            isActive: global?.bans.isActive ?? false,
            remainingSeconds: global?.bans.remainingSeconds ?? 0,
            lastBanReason: global?.bans.lastBanReason ?? "–"
        )
    }
    /// The remaining time for the player's ban.
    var unBanDateText: String {
        let f = DateComponentsFormatter()
        f.allowedUnits = [.day, .hour, .minute, .second]
        f.unitsStyle = .short

        let start = Date.now
        let end = Date(timeIntervalSince1970: TimeInterval(bans.remainingSeconds))
        return f.string(from: start, to: end) ?? "–"
    }
    /// The player's battle royale rank information.
    var brRank: Rank {
        Rank(
            rankScore: global?.rank.rankScore ?? 0,
            rankName: global?.rank.rankName ?? "–",
            rankDiv: global?.rank.rankDiv ?? 0,
            ladderPosPlatform: global?.rank.ladderPosPlatform ?? 0,
            rankImg: global?.rank.rankImg ?? "",
            rankedSeason: global?.rank.rankedSeason ?? "–"
        )
    }
    /// The player's arenas rank information.
    var arenaRank: Rank {
        Rank(
            rankScore: global?.arena.rankScore ?? 0,
            rankName: global?.arena.rankName ?? "–",
            rankDiv: global?.arena.rankDiv ?? 0,
            ladderPosPlatform: global?.arena.ladderPosPlatform ?? 0,
            rankImg: global?.arena.rankImg ?? "",
            rankedSeason: global?.arena.rankedSeason ?? "–"
        )
    }
    /// The player's battle pass information.
    var battlePass: Battlepass {
        Battlepass(
            level: global?.battlepass.level ?? "–",
            history: global?.battlepass.history ?? [:]
        )
    }

    // MARK: Realtime

    /// The player's lobby state
    var lobbyState: String { realtime?.lobbyState ?? "–" }
    /// Is the player online?
    var isOnline: Bool { realtime?.isOnline ?? 0 == 1 }
    /// Is the player in game?
    var isInGame: Bool { realtime?.isInGame ?? 0 == 1 }
    /// Can the player be joined?
    var isJoinable: Bool { realtime?.canJoin ?? 0 == 1 }
    /// Is the player's party full?
    var isPartyFull: Bool { realtime?.partyFull ?? 0 == 1 }
    /// The currently active selected legend for the player. The last legend they played or configured.
    var selectedLegendName: String { realtime?.selectedLegend ?? "–" }
    /// The player's current state.
    var currentState: String { realtime?.currentState ?? "–" }
    /// The player's current state timestamp. When the information updated.
    var currentStateSinceTimestamp: Int { realtime?.currentStateSinceTimestamp ?? 0 }
    /// When the timestamp was created in nicely formatted text.
    var currentStateSinceTimestampText: String {
        guard let timestamp = realtime?.currentStateSinceTimestamp else {
            return "–"
        }

        let f = DateComponentsFormatter()
        f.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        f.unitsStyle = .brief

        let now = Date.now
        let timestampDate = Date(timeIntervalSince1970: TimeInterval(timestamp))
        return f.string(from: timestampDate, to: now) ?? "–"
    }
    /// The player's current state in simple text.
    var currentStateText: String { realtime?.currentStateAsText ?? "–" }

    // Legends

    /// The currently active selected legend.
    var selectedLegend: SelectedLegend? { legends?.selected }
    /// All Apex legends and their image assets.
    var allLegends: AllLegends {
        AllLegends(
            revenant: legends?.all.revenant,
            crypto: legends?.all.crypto,
            horizon: legends?.all.horizon,
            gibraltar: legends?.all.gibraltar,
            wattson: legends?.all.wattson,
            fuse: legends?.all.fuse,
            bangalore: legends?.all.bangalore,
            wraith: legends?.all.wraith,
            octane: legends?.all.octane,
            bloodhound: legends?.all.bloodhound,
            caustic: legends?.all.caustic,
            lifeline: legends?.all.lifeline,
            pathfinder: legends?.all.pathfinder,
            loba: legends?.all.loba,
            mirage: legends?.all.mirage,
            rampart: legends?.all.rampart,
            valkyrie: legends?.all.valkyrie,
            seer: legends?.all.seer,
            ash: legends?.all.ash,
            madMaggie: legends?.all.madMaggie,
            newcastle: legends?.all.newcastle,
            vantage: legends?.all.vantage
        )
    }

    // MARK: Total

    /// The player's cumulative damage in the game.
    var totalDamage: ApexItem { total?.damage ?? ApexItem(name: "–", value: 0) }
    /// The cumulative amount of enemy players the player has scanned.
    var totalEnemiesScanned: ApexItem { total?.enemiesScanned ?? ApexItem(name: "–", value: 0) }
    /// The cumulative amount of special event kills for the player.
    var totalSpecialEventKills: ApexItem { total?.specialEventKills ?? ApexItem(name: "–", value: 0) }
    /// The player's kill death ratio.
    var kdRatio: Kd { total?.kd ?? Kd(value: "–", name: "–") }

    enum CodingKeys: String, CodingKey {
        case global = "global"
        case realtime = "realtime"
        case legends = "legends"
        case mozambiquehereInternal = "mozambiquehere_internal"
        case als = "ALS"
        case total = "total"
    }

    private let global: Global?
    private let realtime: Realtime?
    private let legends: Legends?
    private let mozambiquehereInternal: MozambiquehereInternal?
    private let als: Als?
    private let total: Total?
}

struct Als: Codable {
    let isALSDataEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case isALSDataEnabled = "isALSDataEnabled"
    }
}

struct Global: Codable {
    let name: String?
    let uid: Int
    let avatar: String
    let platform: String
    let level: Int
    let toNextLevelPercent: Int
    let internalUpdateCount: Int
    let bans: Bans
    let rank: Rank
    let arena: Rank
    let battlepass: Battlepass
    let internalParsingVersion: Int
    let badges: [ApexItem]?
    let levelPrestige: Int?

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

struct Rank: Codable {
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

struct ApexItem: Codable {
    let name: String?
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
    let revenant: Legend?
    let crypto: Legend?
    let horizon: Legend?
    let gibraltar: Legend?
    let wattson: Legend?
    let fuse: Legend?
    let bangalore: Legend?
    let wraith: Legend?
    let octane: Legend?
    let bloodhound: Bloodhound?
    let caustic: Legend?
    let lifeline: Legend?
    let pathfinder: Legend?
    let loba: Legend?
    let mirage: Legend?
    let rampart: Legend?
    let valkyrie: Legend?
    let seer: Legend?
    let ash: Legend?
    let madMaggie: Legend?
    let newcastle: Legend?
    let vantage: Legend?

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
    let data: [BloodhoundDatum]?
    let gameInfo: BloodhoundGameInfo?
    let imgAssets: ImgAssets

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case gameInfo = "gameInfo"
        case imgAssets = "ImgAssets"
    }
}

struct BloodhoundDatum: Codable {
    let name: String?
    let value: Int
    let key: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
        case key = "key"
    }
}

struct BloodhoundGameInfo: Codable {
    let badges: [ApexItem]?

    enum CodingKeys: String, CodingKey {
        case badges = "badges"
    }
}

struct SelectedLegend: Codable {
    let legendName: String
    let data: [SelectedDatum]?
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
    let name: String?
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
    let badges: [Badge]?

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
    let name: String?
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
    let damage: ApexItem?
    let enemiesScanned: ApexItem?
    let specialEventKills: ApexItem?
    let kd: Kd?

    enum CodingKeys: String, CodingKey {
        case damage = "damage"
        case enemiesScanned = "enemies_scanned"
        case specialEventKills = "specialEvent_kills"
        case kd = "kd"
    }
}

struct Kd: Codable {
    let value: String
    let name: String?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case name = "name"
    }
}
