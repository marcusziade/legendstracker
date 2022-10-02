import SwiftUI

struct ServerStatusView: View {

    @ObservedObject var model: ServerStatusVM

    var body: some View {
        switch model.state {

        case .loading:
            ProgressView()

        case .error(message: let errorMessage):
            VStack {
                Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                Button { Task { await model.reload() } } label: {
                    Text("Retry")
                }
            }
            
        case .result(status: let status):
            ServerStatusRegionsView(status: status)
        }
    }
}

struct ServerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        ServerStatusView(model: ServerStatusVM.mock)
    }
}
