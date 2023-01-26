import SwiftUI

struct EANovaFusionScrollView: View {
    
    let status: ServerStatus
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("EA Nova Fusion")
                .font(.title2)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ServerStatusRegionView(
                        title: "EU West",
                        status: status.eaNovafusion.euWest.status,
                        httpCode: status.eaNovafusion.euWest.httpCode,
                        responseTime: status.eaNovafusion.euWest.responseTime,
                        queryTimestamp: status.eaNovafusion.euWest.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "EU East",
                        status: status.eaNovafusion.euEast.status,
                        httpCode: status.eaNovafusion.euEast.httpCode,
                        responseTime: status.eaNovafusion.euEast.responseTime,
                        queryTimestamp: status.eaNovafusion.euEast.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US West",
                        status: status.eaNovafusion.usWest.status,
                        httpCode: status.eaNovafusion.usWest.httpCode,
                        responseTime: status.eaNovafusion.usWest.responseTime,
                        queryTimestamp: status.eaNovafusion.usWest.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US Central",
                        status: status.eaNovafusion.usCentral.status,
                        httpCode: status.eaNovafusion.usCentral.httpCode,
                        responseTime: status.eaNovafusion.usCentral.responseTime,
                        queryTimestamp: status.eaNovafusion.usCentral.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "US East",
                        status: status.eaNovafusion.usEast.status,
                        httpCode: status.eaNovafusion.usEast.httpCode,
                        responseTime: status.eaNovafusion.usEast.responseTime,
                        queryTimestamp: status.eaNovafusion.usEast.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "South America",
                        status: status.eaNovafusion.southAmerica.status,
                        httpCode: status.eaNovafusion.southAmerica.httpCode,
                        responseTime: status.eaNovafusion.southAmerica.responseTime,
                        queryTimestamp: status.eaNovafusion.southAmerica.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Asia",
                        status: status.eaNovafusion.asia.status,
                        httpCode: status.eaNovafusion.asia.httpCode,
                        responseTime: status.eaNovafusion.asia.responseTime,
                        queryTimestamp: status.eaNovafusion.asia.queryTimestamp
                    )
                }
            }
        }
    }
}

struct EANovaFusionScrollView_Previews: PreviewProvider {
    static var previews: some View {
        EANovaFusionScrollView(status: ApexService().serverStatusMock)
            .preferredColorScheme(.dark)
    }
}

