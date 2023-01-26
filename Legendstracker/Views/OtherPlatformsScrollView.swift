import SwiftUI

struct OtherPlatformsScrollView: View {
    
    let status: ServerStatus
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Other platforms")
                .font(.title2)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ServerStatusRegionView(
                        title: "Playstation",
                        status: status.otherPlatforms.playstationNetwork.status,
                        httpCode: 0,
                        responseTime: 0,
                        queryTimestamp: status.otherPlatforms.playstationNetwork.queryTimestamp
                    )
                    ServerStatusRegionView(
                        title: "Xbox",
                        status: status.otherPlatforms.xboxLive.status,
                        httpCode: 0,
                        responseTime: 0,
                        queryTimestamp: status.otherPlatforms.xboxLive.queryTimestamp
                    )
                }
            }
        }
    }
}

struct OtherPlatformsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPlatformsScrollView(status: ApexService().serverStatusMock)
    }
}

