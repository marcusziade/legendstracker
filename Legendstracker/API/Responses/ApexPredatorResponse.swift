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

