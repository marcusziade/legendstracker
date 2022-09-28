//
//  PlayerUIDResponse.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let playerUIDResponse = try? newJSONDecoder().decode(PlayerUIDResponse.self, from: jsonData)

import Foundation

struct PlayerUIDResponse: Codable {
    let name: String
    let uid: String
    let pid: String
    let avatar: String
}
