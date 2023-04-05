import SwiftUI

struct ServerStatusView: View {

    @StateObject var model = ServerStatusVM(service: ApexService())

    var body: some View {
        switch model.state {

        case .loading:
            ProgressView()

        case .error(message: let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")

        case .result(let status):
            ServerStatusRegionsView(status: status)
            
        case .empty:
            EmptyView()
        }
    }
}

struct ServerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        ServerStatusView(model: ServerStatusVM.mock)
    }
}
