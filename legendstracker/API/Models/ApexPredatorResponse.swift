//
//  ApexPredatorResponse.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let apexPredatorResponse = try? newJSONDecoder().decode(ApexPredatorResponse.self, from: jsonData)

import Foundation

struct ApexPredatorResponse: Codable {
    let rp: Ap
    let ap: Ap
}

struct Ap: Codable {
    let pc: PC
    let ps4: PC
    let x1: PC
    let apSWITCH: PC
}

struct PC: Codable {
    let foundRank: Int
    let val: Int
    let uid: String
    let updateTimestamp: Int
    let totalMastersAndPreds: Int
}
