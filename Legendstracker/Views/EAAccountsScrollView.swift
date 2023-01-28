import SwiftUI

struct EAAccountsScrollView: View {

    let status: ServerStatus

    var body: some View {
        VStack(alignment: .leading) {
            Text("EA Accounts")
                .font(.title2)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ServerStatusRegionView(
                        title: "EU West",
                        status: status.eaAccounts.euWest.status,
                        httpCode: status.eaAccounts.euWest.httpCode,
                        responseTime: status.eaAccounts.euWest.responseTime,
                        queryTimestamp: status.eaAccounts.euWest.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "EU East",
                        status: status.eaAccounts.euEast.status,
                        httpCode: status.eaAccounts.euEast.httpCode,
                        responseTime: status.eaAccounts.euEast.responseTime,
                        queryTimestamp: status.eaAccounts.euEast.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US West",
                        status: status.eaAccounts.usWest.status,
                        httpCode: status.eaAccounts.usWest.httpCode,
                        responseTime: status.eaAccounts.usWest.responseTime,
                        queryTimestamp: status.eaAccounts.usWest.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US Central",
                        status: status.eaAccounts.usCentral.status,
                        httpCode: status.eaAccounts.usCentral.httpCode,
                        responseTime: status.eaAccounts.usCentral.responseTime,
                        queryTimestamp: status.eaAccounts.usCentral.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US East",
                        status: status.eaAccounts.usEast.status,
                        httpCode: status.eaAccounts.usEast.httpCode,
                        responseTime: status.eaAccounts.usEast.responseTime,
                        queryTimestamp: status.eaAccounts.usEast.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "South America",
                        status: status.eaAccounts.southAmerica.status,
                        httpCode: status.eaAccounts.southAmerica.httpCode,
                        responseTime: status.eaAccounts.southAmerica.responseTime,
                        queryTimestamp: status.eaAccounts.southAmerica.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Asia",
                        status: status.eaAccounts.asia.status,
                        httpCode: status.eaAccounts.asia.httpCode,
                        responseTime: status.eaAccounts.asia.responseTime,
                        queryTimestamp: status.eaAccounts.asia.queryTimestamp
                    )
                }
            }
        }
    }
}

struct EAAccountsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        EAAccountsScrollView(status: ApexService().serverStatusMock)
    }
}
