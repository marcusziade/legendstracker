import Kingfisher
import SwiftUI

struct SearchPlayerView: View {

    @ObservedObject var model: SearchPlayerVM

    var body: some View {
        NavigationView {
            VStack {
                switch model.state {
                case .loading:
                    ZStack {
                        PlayerGlobalInfoView(player: ApexService().playerMock, friendsStore: FriendsStore.mock)
                            .redacted(reason: .placeholder)
                        VStack {
                            ProgressView()
                            Spacer()
                        }
                    }

                case .error(message: let errorMessage):
                    ZStack {
                        PlayerGlobalInfoView(player: ApexService().playerMock, friendsStore: FriendsStore.mock)
                            .redacted(reason: .placeholder)
                        Color.black.opacity(0.5)
                        VStack {
                            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                                .shadow(radius: 5).shadow(radius: 5)
                                .shadow(radius: 5).shadow(radius: 5)
                            Button { Task { await model.reload() } } label: {
                                Text("Retry")
                            }
                        }
                    }

                case .result(player: let p):
                    PlayerGlobalInfoView(player: p, friendsStore: FriendsStore())

                case .idle:
                    Text("No search query").fontWeight(.black)
                }
            }
            .toolbar {
                Button("Reload") { Task { await model.reload() } }
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
