import SwiftUI

struct ApexCrossPlayScrollView: View {

    let status: ServerStatus

    var body: some View {
        VStack(alignment: .leading) {
            Text("Crossplay")
                .font(.title2)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ServerStatusRegionView(
                        title: "EU West",
                        status: status.apexOauthCrossplay.euWest.status,
                        httpCode: status.apexOauthCrossplay.euWest.httpCode,
                        responseTime: status.apexOauthCrossplay.euWest.responseTime,
                        queryTimestamp: status.apexOauthCrossplay.euWest.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "EU East",
                        status: status.apexOauthCrossplay.euEast.status,
                        httpCode: status.apexOauthCrossplay.euEast.httpCode,
                        responseTime: status.apexOauthCrossplay.euEast.responseTime,
                        queryTimestamp: status.apexOauthCrossplay.euEast.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US West",
                        status: status.apexOauthCrossplay.usWest.status,
                        httpCode: status.apexOauthCrossplay.usWest.httpCode,
                        responseTime: status.apexOauthCrossplay.usWest.responseTime,
                        queryTimestamp: status.apexOauthCrossplay.usWest.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US Central",
                        status: status.apexOauthCrossplay.usCentral.status,
                        httpCode: status.apexOauthCrossplay.usCentral.httpCode,
                        responseTime: status.apexOauthCrossplay.usCentral.responseTime,
                        queryTimestamp: status.apexOauthCrossplay.usCentral.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US East",
                        status: status.apexOauthCrossplay.usEast.status,
                        httpCode: status.apexOauthCrossplay.usEast.httpCode,
                        responseTime: status.apexOauthCrossplay.usEast.responseTime,
                        queryTimestamp: status.apexOauthCrossplay.usEast.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "South America",
                        status: status.apexOauthCrossplay.southAmerica.status,
                        httpCode: status.apexOauthCrossplay.southAmerica.httpCode,
                        responseTime: status.apexOauthCrossplay.southAmerica.responseTime,
                        queryTimestamp: status.apexOauthCrossplay.southAmerica.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Asia",
                        status: status.apexOauthCrossplay.asia.status,
                        httpCode: status.apexOauthCrossplay.asia.httpCode,
                        responseTime: status.apexOauthCrossplay.asia.responseTime,
                        queryTimestamp: status.apexOauthCrossplay.asia.queryTimestamp
                    )
                }
            }
        }
    }
}

struct ApexCrossPlayScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ApexCrossPlayScrollView(status: ApexService().serverStatusMock)
    }
}
