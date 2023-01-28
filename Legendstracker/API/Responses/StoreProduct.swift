import Foundation

struct StoreProduct: Codable, Identifiable {
    var id: String { offerID }

    let title: String
    let desc: String
    let tag: String
    let purchaseLimit: Int
    let isAvailable: Bool
    let expireTimestamp: Int
    let shopType: String
    let pricing: [Pricing]
    let content: [Content]
    let offerID: String
    let asset: String
    let originalPrice: Int?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case desc = "desc"
        case tag = "tag"
        case purchaseLimit = "purchaseLimit"
        case isAvailable = "isAvailable"
        case expireTimestamp = "expireTimestamp"
        case shopType = "shopType"
        case pricing = "pricing"
        case content = "content"
        case offerID = "offerID"
        case asset = "asset"
        case originalPrice = "originalPrice"
    }

    var expireDateText: String {
        let date = Date(timeIntervalSince1970: TimeInterval(expireTimestamp))
        return dateFormatter.localizedString(for: date, relativeTo: Date.now)
    }

    private let dateFormatter: RelativeDateTimeFormatter = {
        let f = RelativeDateTimeFormatter()
        return f
    }()
}

struct Content: Codable {
    let ref: String
    let name: String
    let quantity: Int

    enum CodingKeys: String, CodingKey {
        case ref = "ref"
        case name = "name"
        case quantity = "quantity"
    }
}

struct Pricing: Codable {
    let ref: Ref
    let quantity: Int

    enum CodingKeys: String, CodingKey {
        case ref = "ref"
        case quantity = "quantity"
    }
}

enum Ref: String, Codable {
    case apexCoins = "Apex Coins"
    case legendTokens = "Legend Tokens"
}
