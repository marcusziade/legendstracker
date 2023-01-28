import SwiftUI

struct ServerStatusRegionView: View {

    let title: String
    let status: Status
    let httpCode: Int
    /// For "down" status, the response time is -1.
    let responseTime: Int
    let queryTimestamp: Int

    var body: some View {
        VStack {
            Image(systemName: status.icon)
                .font(.title2)
                .foregroundColor(status.color)
            Text(responseTime == -1 || responseTime == 0 ? "–" : "\(responseTime)ms")
                .font(.caption)
            Text(formatter.string(from: Date(timeIntervalSince1970: TimeInterval(queryTimestamp))))
                .font(.caption2)
            Text(title)
                .font(.headline)
        }
    }

    var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .none
        f.timeStyle = .short
        return f
    }()
}

struct ServerStatusRegionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            ServerStatusRegionView(
                title: "EU West", status: .up, httpCode: 200, responseTime: 39, queryTimestamp: 1_664_524_620)
            ServerStatusRegionView(
                title: "EU East", status: .slow, httpCode: 200, responseTime: 0, queryTimestamp: 1_764_424_620)
            ServerStatusRegionView(
                title: "US West", status: .down, httpCode: 500, responseTime: -1, queryTimestamp: 1_964_424_620)
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
