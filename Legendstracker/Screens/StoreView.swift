import SwiftUI

struct StoreView: View {

    @ObservedObject var model: StoreVM

    var body: some View {
        switch model.state {

        case .loading:
            ProgressView().progressViewStyle(.linear)

        case .error(message: let errorMessage):
            VStack {
                Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                Button { Task { await model.reload() } } label: {
                    Text("Retry")
                }
            }

        case .result(store: let storeProducts):
            NavigationView {
                List(storeProducts) { p in
                    StoreRow(product: p)
                        .listRowInsets(EdgeInsets(top: 1, leading: .zero, bottom: 1, trailing: .zero))
                        .listRowSeparator(.visible)
                        .listRowSeparatorTint(.white)
                }
                .navigationTitle("Store")
                .listStyle(.plain)
                .refreshable { await model.reload() }
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(model: StoreVM.mock)
    }
}
