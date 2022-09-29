//
//  MapRotationResponse.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mapRotationResponse = try? newJSONDecoder().decode(MapRotationResponse.self, from: jsonData)

import Foundation

struct MapRotationResponse: Codable {
    let current: Current
    let next: Next
    
    enum CodingKeys: String, CodingKey {
        case current = "current"
        case next = "next"
    }
    
    var currentIntevalText: String {
        let start = Date(timeIntervalSince1970: TimeInterval(self.current.start))
        let end = Date(timeIntervalSince1970: TimeInterval(self.current.end))
        return intervalFormatter.string(from: start, to: end)
    }
    
    var currentDateText: String {
        let start = Date(timeIntervalSince1970: TimeInterval(self.current.start))
        let end = Date(timeIntervalSince1970: TimeInterval(self.current.end))
        return dateComponentsFormatter.string(from: start, to: end)!
    }
    
    var nextIntevalText: String {
        let start = Date(timeIntervalSince1970: TimeInterval(self.next.start))
        let end = Date(timeIntervalSince1970: TimeInterval(self.next.end))
        return intervalFormatter.string(from: start, to: end)
    }
    
    var nextDateText: String {
        let start = Date(timeIntervalSince1970: TimeInterval(self.next.start))
        let end = Date(timeIntervalSince1970: TimeInterval(self.next.end))
        return dateComponentsFormatter.string(from: start, to: end)!
    }

    private let intervalFormatter: DateIntervalFormatter = {
        let f = DateIntervalFormatter()
        f.dateStyle = .none
        f.timeStyle = .short
        return f
    }()
    
    private let dateComponentsFormatter: DateComponentsFormatter = {
        let f = DateComponentsFormatter()
        f.allowedUnits = [.day, .hour, .minute]
        f.unitsStyle = .short
        return f
    }()
}

struct Current: Codable {
    let start: Int
    let end: Int
    let readableDateStart: String
    let readableDateEnd: String
    let map: String
    let code: String
    let durationInSecs: Int
    let durationInMinutes: Int
    let asset: String
    let remainingSecs: Int
    let remainingMins: Int
    let remainingTimer: String
    
    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
        case readableDateStart = "readableDate_start"
        case readableDateEnd = "readableDate_end"
        case map = "map"
        case code = "code"
        case durationInSecs = "DurationInSecs"
        case durationInMinutes = "DurationInMinutes"
        case asset = "asset"
        case remainingSecs = "remainingSecs"
        case remainingMins = "remainingMins"
        case remainingTimer = "remainingTimer"
    }
}

struct Next: Codable {
    let start: Int
    let end: Int
    let readableDateStart: String
    let readableDateEnd: String
    let map: String
    let code: String
    let durationInSecs: Int
    let durationInMinutes: Int
    
    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
        case readableDateStart = "readableDate_start"
        case readableDateEnd = "readableDate_end"
        case map = "map"
        case code = "code"
        case durationInSecs = "DurationInSecs"
        case durationInMinutes = "DurationInMinutes"
    }
}
