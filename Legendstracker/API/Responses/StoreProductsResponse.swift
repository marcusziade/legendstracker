//
//  StoreProductsResponse.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let storeProductsResponse = try? newJSONDecoder().decode(StoreProductsResponse.self, from: jsonData)

import Foundation

struct StoreProducts: Codable {
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
}

struct Content: Codable {
    let ref: String
    let name: String
    let quantity: Int
}

struct Pricing: Codable {
    let ref: Ref
    let quantity: Int
}

enum Ref: String, Codable {
    case apexCoins = "Apex Coins"
    case legendTokens = "Legend Tokens"
}
