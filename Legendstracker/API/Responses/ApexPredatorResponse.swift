import Foundation

struct ApexPredatorResponse: Codable {
    private let RP: RankedPointsType
    private let AP: RankedPointsType
}

extension ApexPredatorResponse {

    var timestampString: String {
        let date = Date(timeIntervalSince1970: TimeInterval(RP.PC.updateTimestamp))
        return DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .medium)
    }

    // Battle royale
    var pcRequiredRP: String { String(RP.PC.val) }
    var pcTotalMastersAndPredsBR: String { String(RP.PC.totalMastersAndPreds) }
    var psRequiredRP: String { String(RP.PS4.val) }
    var psTotalMastersAndPredsBR: String { String(RP.PS4.totalMastersAndPreds) }
    var x1RequiredRP: String { String(RP.X1.val) }
    var x1TotalMastersAndPredsBR: String { String(RP.X1.totalMastersAndPreds) }

    // Arena
    var pcRequiredAP: String { String(AP.PC.val) }
    var pcTotalMastersAndPredsAP: String { String(AP.PC.totalMastersAndPreds) }
    var psRequiredAP: String { String(AP.PS4.val) }
    var psTotalMastersAndPredsAP: String { String(AP.PS4.totalMastersAndPreds) }
    var x1RequiredAP: String { String(AP.X1.val) }
    var x1TotalMastersAndPredsAP: String { String(AP.X1.totalMastersAndPreds) }
}

struct RankedPointsType: Codable {
    let PC: Platform
    let PS4: Platform
    let X1: Platform
    let SWITCH: Platform
}

struct Platform: Codable {
    let foundRank: Int
    let val: Int
    let uid: String
    let updateTimestamp: Int
    let totalMastersAndPreds: Int
}
