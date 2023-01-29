import SwiftUI

struct ApexPredatorView: View {

    @StateObject var model: ApexPredatorVM

    var body: some View {
        switch model.state {
        case .loading:
            ProgressView().progressViewStyle(.linear)
        case .error(let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
        case .result(let predators):
            List {
                Section("Battle Royale") {
                    VStack {
                        Image(systemName: "desktopcomputer")
                        Text(predators.pcRequiredRP)
                        Text(predators.pcTotalMastersAndPredsBR)
                    }
                    VStack {
                        Image(systemName: "logo.playstation")
                        Text(predators.psRequiredRP)
                        Text(predators.psTotalMastersAndPredsBR)
                    }
                    VStack {
                        Image(systemName: "logo.xbox")
                        Text(predators.x1RequiredRP)
                        Text(predators.x1TotalMastersAndPredsBR)
                    }
                }

                Section("Arenas") {
                    VStack {
                        Image(systemName: "desktopcomputer")
                        Text(predators.pcRequiredAP)
                        Text(predators.pcTotalMastersAndPredsAP)
                    }
                    VStack {
                        Image(systemName: "logo.playstation")
                        Text(predators.psRequiredAP)
                        Text(predators.psTotalMastersAndPredsAP)
                    }
                    VStack {
                        Image(systemName: "logo.xbox")
                        Text(predators.x1RequiredAP)
                        Text(predators.x1TotalMastersAndPredsAP)
                    }
                }

                Text(predators.timestampString)
            }
        }
    }
}

struct ApexPredatorView_Previews: PreviewProvider {
    static var previews: some View {
        ApexPredatorView(model: ApexPredatorVM.mock)
    }
}
