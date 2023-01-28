import SwiftUI

struct ServerStatusRegionsView: View {

    let status: ServerStatus

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 40) {
                    OriginLoginScrollView(status: status)
                    EANovaFusionScrollView(status: status)
                    EAAccountsScrollView(status: status)
                    ApexCrossPlayScrollView(status: status)
                    OtherPlatformsScrollView(status: status)
                    CoreStatusScrollView(status: status)
                }
            }
            .navigationTitle("Status")
        }
    }
}

struct ServerStatusRegionsHStackView_Previews: PreviewProvider {
    static var previews: some View {
        ServerStatusRegionsView(status: ApexService().serverStatusMock)
            .preferredColorScheme(.dark)
    }
}
