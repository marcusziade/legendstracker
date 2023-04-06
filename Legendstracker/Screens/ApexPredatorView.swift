import SwiftUI

struct ApexPredatorView: View {

    @StateObject var model = ApexPredatorVM(service: ApexService())

    var body: some View {
        switch model.state {
        case .loading:
            ProgressView().progressViewStyle(.linear)
        case .error(let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
        case .result(let predators):
            NavigationView {
                List {
                    Section(header: Text("Battle Royale").bold().foregroundColor(.purple)) {
                        HStack {
                            Image(systemName: "desktopcomputer")
                                .foregroundColor(.green)
                            VStack(alignment: .leading) {
                                Text("PC")
                                    .font(.headline)
                                Text("RP needed: \(predators.pcRequiredRP)")
                                    .font(.subheadline)
                                Text("Masters: \(predators.pcTotalMastersAndPredsBR)")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            Image(systemName: "logo.playstation")
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("Playstation")
                                    .font(.headline)
                                Text("RP needed: \(predators.psRequiredRP)")
                                    .font(.subheadline)
                                Text("Masters: \(predators.psTotalMastersAndPredsBR)")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            Image(systemName: "logo.xbox")
                                .foregroundColor(.green)
                            VStack(alignment: .leading) {
                                Text("Xbox")
                                    .font(.headline)
                                Text("RP needed: \(predators.x1RequiredRP)")
                                    .font(.subheadline)
                                Text("Masters: \(predators.x1TotalMastersAndPredsBR)")
                                    .font(.caption)
                            }
                        }
                    }
                    
                    Section(header: Text("Arenas").bold().foregroundColor(.purple)) {
                        HStack {
                            Image(systemName: "desktopcomputer")
                                .foregroundColor(.orange)
                            VStack(alignment: .leading) {
                                Text("PC")
                                    .font(.headline)
                                Text("AP needed: \(predators.pcRequiredAP)")
                                    .font(.subheadline)
                                Text("Masters: \(predators.pcTotalMastersAndPredsAP)")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            Image(systemName: "logo.playstation")
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("Playstation")
                                    .font(.headline)
                                Text("AP needed: \(predators.psRequiredAP)")
                                    .font(.subheadline)
                                Text("Masters: \(predators.psTotalMastersAndPredsAP)")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            Image(systemName: "logo.xbox")
                                .foregroundColor(.green)
                            VStack(alignment: .leading) {
                                Text("Xbox")
                                    .font(.headline)
                                Text("AP needed: \(predators.x1RequiredAP)")
                                    .font(.subheadline)
                                Text("Masters: \(predators.x1TotalMastersAndPredsAP)")
                                    .font(.caption)
                            }
                        }
                    }
                    
                    Section {
                        Text("To reach Apex Predator rank, players need to accumulate a certain amount of RP (Ranked Points) or AP (Arena Points) depending on the game mode. The number of Masters on each platform is also shown below.")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        Text("Last updated: \(predators.timestampString)")
                            .foregroundColor(.gray)
                        WebView(url: URL(string: "https://www.youtube.com/embed/sTDqC7-GhCM?playsinline=1&mute=1&autoplay=1&controls=0&loop=1")!)
                            .frame(height: 200)
                            .cornerRadius(8)
                    }
                }
                .navigationTitle("Apex Predator Ranks")
            }
        case .empty:
            EmptyView()
        }
    }
}

struct ApexPredatorView_Previews: PreviewProvider {
    static var previews: some View {
        ApexPredatorView(model: ApexPredatorVM.mock)
            .preferredColorScheme(.dark)
    }
}
