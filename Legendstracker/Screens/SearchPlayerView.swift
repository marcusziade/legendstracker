import Kingfisher
import SwiftUI

struct SearchPlayerView: View {

    @StateObject var model: SearchPlayerVM
    
    init(model: SearchPlayerVM) {
        self._model = StateObject(wrappedValue: model)
    }

    var body: some View {
        NavigationView {
            VStack {
                switch model.state {
                case .loading:
                    ZStack {
                        PlayerGlobalInfoView(player: ApexService().playerMock)
                            .redacted(reason: .placeholder)
                        VStack {
                            ProgressView()
                            Spacer()
                        }
                    }

                case .error(message: let errorMessage):
                    ZStack {
                        PlayerGlobalInfoView(player: ApexService().playerMock)
                            .redacted(reason: .placeholder)
                        Color.black.opacity(0.5)
                        Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                            .shadow(radius: 5).shadow(radius: 5)
                            .shadow(radius: 5).shadow(radius: 5)
                    }

                case .result(player: let p):
                    PlayerGlobalInfoView(player: p)

                case .empty:
                    Text("No search query").fontWeight(.black)
                    PlayerGlobalInfoView(player: ApexService().playerMock)
                        .redacted(reason: .placeholder)
                        .toolbar {
                            Button {
                                model.showPredatorsView = true
                            } label: {
                                Text("Pred")
                            }
                        }
                        .sheet(isPresented: $model.showPredatorsView) {
                            ApexPredatorView(model: ApexPredatorVM(service: ApexService()))
                        }
                }
            }
        }
        .searchable(text: $model.searchQuery)
    }
}

struct SearchPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlayerView(model: SearchPlayerVM.mock)
            .preferredColorScheme(.dark)
    }
}
