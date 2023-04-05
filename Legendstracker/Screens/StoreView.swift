import SwiftUI

struct StoreView: View {

    @ObservedObject var model: StoreVM

    var body: some View {
        switch model.state {
        case .loading:
            ProgressView().progressViewStyle(.linear)
        case .error(message: let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
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
                .refreshable { await model.refresh() }
            }
        case .empty:
            Text("-")
                .fontWeight(.black)
                .font(.largeTitle)
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(model: StoreVM.mock)
    }
}
