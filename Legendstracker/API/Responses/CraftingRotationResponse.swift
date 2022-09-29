//
//  CraftingRotationResponse.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let craftingRotationResponse = try? newJSONDecoder().decode(CraftingRotationResponse.self, from: jsonData)

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
