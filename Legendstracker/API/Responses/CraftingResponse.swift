import Foundation
import SwiftUI

typealias CraftingResponse = [CraftingResponseElement]

struct CraftingResponseElement: Codable, Hashable {
    let bundle: String
    let start: Int?
    let end: Int?
    let startDate: String?
    let endDate: String?
    let bundleType: String
    let bundleContent: [BundleContent]
    
    enum CodingKeys: String, CodingKey {
        case bundle
        case start
        case end
        case startDate
        case endDate
        case bundleType
        case bundleContent
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(bundle)
        hasher.combine(start)
        hasher.combine(end)
        hasher.combine(startDate)
        hasher.combine(endDate)
        hasher.combine(bundleType)
        hasher.combine(bundleContent)
    }
}

struct BundleContent: Codable, Hashable {
    let item: String
    let cost: Int
    let itemType: ItemType
    
    enum CodingKeys: String, CodingKey {
        case item
        case cost
        case itemType
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(item)
        hasher.combine(cost)
        hasher.combine(itemType)
    }
}

struct ItemType: Codable, Hashable {
    let name: String
    let rarity: Rarity
    let asset: URL
    let rarityHex: RarityHex
    
    enum CodingKeys: String, CodingKey {
        case name
        case rarity
        case asset
        case rarityHex
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(rarity)
        hasher.combine(asset)
        hasher.combine(rarityHex)
    }
}

enum Rarity: String, Codable {
    case common = "Common"
    case epic = "Epic"
    case rare = "Rare"
}

enum RarityHex: String, Codable {
    case b200Ff = "#B200FF"
    case the0094Ff = "#0094FF"
    case the808080 = "#808080"
}
