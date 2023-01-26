import Foundation

struct CraftingRotationResponse: Codable {
    let bundle: String
    let start: Int?
    let end: Int?
    let startDate: String?
    let endDate: String?
    let bundleType: String
    let bundleContent: [BundleContent]
}

struct BundleContent: Codable {
    let item: String
    let cost: Int
    let itemType: ItemType
}

struct ItemType: Codable {
    let name: String
    let rarity: String
    let asset: String
    let rarityHex: String
}

